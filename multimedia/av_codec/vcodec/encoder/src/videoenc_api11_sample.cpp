/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <arpa/inet.h>
#include <sys/time.h>
#include <utility>
#include "iconsumer_surface.h"
#include "openssl/crypto.h"
#include "openssl/sha.h"
#include "native_buffer_inner.h"
#include "videoenc_api11_sample.h"
#include "native_avcapability.h"
using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr uint32_t FRAME_INTERVAL = 16666;
constexpr uint32_t MAX_PIXEL_FMT = 5;
constexpr uint8_t RGBA_SIZE = 4;
constexpr uint32_t IDR_FRAME_INTERVAL = 10;
constexpr uint32_t DOUBLE = 2;
constexpr uint32_t BADPOC = 1000;
constexpr uint32_t LTR_INTERVAL = 5;
sptr<Surface> cs = nullptr;
sptr<Surface> ps = nullptr;
OH_AVCapability *cap = nullptr;
VEncAPI11Sample *enc_sample = nullptr;
constexpr uint8_t FILE_END = -1;
constexpr uint8_t LOOP_END = 0;
int32_t g_picWidth;
int32_t g_picHeight;
int32_t g_keyWidth;
int32_t g_keyHeight;

void clearIntqueue(std::queue<uint32_t> &q)
{
    std::queue<uint32_t> empty;
    swap(empty, q);
}
} // namespace

VEncAPI11Sample::~VEncAPI11Sample()
{
    if (SURF_INPUT && nativeWindow) {
        OH_NativeWindow_DestroyNativeWindow(nativeWindow);
        nativeWindow = nullptr;
    }
    Release();
}

static void VencError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
}

static void VencFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    cout << "Format Changed" << endl;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &g_picWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &g_picHeight);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &g_keyWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &g_keyHeight);
    cout << "format info: " << OH_AVFormat_DumpInfo(format) << ", OH_MD_KEY_VIDEO_PIC_WIDTH: " << g_picWidth
    << ", OH_MD_KEY_VIDEO_PIC_HEIGHT: "<< g_picHeight << ", OH_MD_KEY_WIDTH: " << g_keyWidth
    << ", OH_MD_KEY_HEIGHT: " << g_keyHeight << endl;
}

static void onEncInputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    VEncAPI11Signal *signal = static_cast<VEncAPI11Signal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(buffer);
    signal->inCond_.notify_all();
}

static void onEncOutputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    VEncAPI11Signal *signal = static_cast<VEncAPI11Signal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->outBufferQueue_.push(buffer);
    signal->outCond_.notify_all();
}

static void onEncInputParam(OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData)
{
    static bool useLtrOnce = false;
    if (!parameter || !userData) {
        return;
    }
    if (enc_sample->frameCount % enc_sample->ltrParam.ltrInterval == 0) {
        OH_AVFormat_SetIntValue(parameter, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_MARK_LTR, 1);
    }
    if (!enc_sample->ltrParam.enableUseLtr) {
        enc_sample->frameCount++;
        OH_VideoEncoder_PushInputParameter(codec, index);
        return;
    }
    static int32_t useLtrIndex = 0;
    if (enc_sample->ltrParam.useLtrIndex == 0) {
        useLtrIndex = LTR_INTERVAL;
    } else if (enc_sample->ltrParam.useBadLtr) {
        useLtrIndex = BADPOC;
    } else {
        uint32_t interval = enc_sample->ltrParam.ltrInterval;
        if (interval > 0 && enc_sample->frameCount > 0 && (enc_sample->frameCount % interval == 0)) {
            useLtrIndex = enc_sample->frameCount / interval * interval;
        }
    }
    if (enc_sample->frameCount > useLtrIndex) {
        if (!enc_sample->ltrParam.useLtrOnce) {
            OH_AVFormat_SetIntValue(parameter, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, useLtrIndex);
        } else {
            if (!useLtrOnce) {
                OH_AVFormat_SetIntValue(parameter, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, useLtrIndex);
                useLtrOnce = true;
            }
        }
    } else if (enc_sample->frameCount == useLtrIndex && enc_sample->frameCount > 0) {
        int32_t sampleInterval = enc_sample->ltrParam.ltrInterval;
        OH_AVFormat_SetIntValue(parameter, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, useLtrIndex - sampleInterval);
    }
    enc_sample->frameCount++;
    OH_VideoEncoder_PushInputParameter(codec, index);
}

void VEncAPI11Sample::DumpLtrInfo(OH_AVBuffer *buffer)
{
    OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
    int32_t isLtr = 0;
    int32_t framePoc = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PER_FRAME_IS_LTR, &isLtr);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PER_FRAME_POC, &framePoc);
}

void VEncAPI11Sample::DumpQPInfo(OH_AVBuffer *buffer)
{
    OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
    int32_t qp_average = 0;
    double mse = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_AVERAGE, &qp_average);
    OH_AVFormat_GetDoubleValue(format, OH_MD_KEY_VIDEO_ENCODER_MSE, &mse);
}

void VEncAPI11Sample::DumpInfo(OH_AVCodecBufferAttr attr, OH_AVBuffer *buffer)
{
    if (enableLTR && attr.flags == AVCODEC_BUFFER_FLAGS_NONE) {
        DumpLtrInfo(buffer);
    }
    if (getQpMse && attr.flags == AVCODEC_BUFFER_FLAGS_NONE) {
        DumpQPInfo(buffer);
    }
}

int64_t VEncAPI11Sample::GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = (int64_t)now.tv_sec * NANOS_IN_SECOND + now.tv_nsec;

    return nanoTime / NANOS_IN_MICRO;
}

int32_t VEncAPI11Sample::ConfigureVideoEncoder()
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);
    if (isAVCEncoder) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, avcProfile);
    } else {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, hevcProfile);
    }
    if (configMain10) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, HEVC_PROFILE_MAIN_10);
    } else if (configMain) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, HEVC_PROFILE_MAIN);
    }
    if (DEFAULT_BITRATE_MODE == CQ) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, DEFAULT_QUALITY);
    } else {
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    }
    if (enableQP) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, DEFAULT_QP);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, DEFAULT_QP);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, DEFAULT_BITRATE_MODE);
    if (enableLTR && (ltrParam.ltrCount >= 0)) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_LTR_FRAME_COUNT, ltrParam.ltrCount);
    }
    if (enableColorSpaceParams) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, DEFAULT_RANGE_FLAG);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, DEFAULT_COLOR_PRIMARIES);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, DEFAULT_TRANSFER_CHARACTERISTICS);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, DEFAULT_MATRIX_COEFFICIENTS);
    }
    int ret = OH_VideoEncoder_Configure(venc_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VEncAPI11Sample::ConfigureVideoEncoder_Temporal(int32_t temporal_gop_size)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);

    if (TEMPORAL_CONFIG) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, temporal_gop_size);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE,
            ADJACENT_REFERENCE);
    }
    if (TEMPORAL_ENABLE) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
    } else {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 0);
    }
    if (TEMPORAL_JUMP_MODE) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE, JUMP_REFERENCE);
    }
    if (enableLTR && (ltrParam.ltrCount > 0)) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_LTR_FRAME_COUNT, ltrParam.ltrCount);
    }
    if (TEMPORAL_UNIFORMLY) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, temporal_gop_size);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE,
            UNIFORMLY_SCALED_REFERENCE);
    }
    int ret = OH_VideoEncoder_Configure(venc_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VEncAPI11Sample::ConfigureVideoEncoder_fuzz(int32_t data)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, data);
    DEFAULT_WIDTH = data;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, data);
    DEFAULT_HEIGHT = data;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, data % MAX_PIXEL_FMT);
    double frameRate = data;
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, frameRate);

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, data);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, data);

    int ret = OH_VideoEncoder_Configure(venc_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VEncAPI11Sample::SetVideoEncoderCallback()
{
    signal_ = new VEncAPI11Signal();
    if (signal_ == nullptr) {
        cout << "Failed to new VEncAPI11Signal" << endl;
        return AV_ERR_UNKNOWN;
    }
    if (SURF_INPUT) {
        int32_t ret = OH_VideoEncoder_RegisterParameterCallback(venc_, onEncInputParam, static_cast<void *>(this));
        if (ret != AV_ERR_OK) {
            return ret;
        }
    }
    cb_.onError = VencError;
    cb_.onStreamChanged = VencFormatChanged;
    cb_.onNeedInputBuffer = onEncInputBufferAvailable;
    cb_.onNewOutputBuffer = onEncOutputBufferAvailable;
    
    return OH_VideoEncoder_RegisterCallback(venc_, cb_, static_cast<void *>(signal_));
}

int32_t VEncAPI11Sample::state_EOS()
{
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inCond_.wait(lock, [this]() { return signal_->inIdxQueue_.size() > 0; });
    uint32_t index = signal_->inIdxQueue_.front();
    OH_AVBuffer *buffer = signal_->inBufferQueue_.front();
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
    lock.unlock();
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    OH_AVBuffer_SetBufferAttr(buffer, &attr);
    return OH_VideoEncoder_PushInputBuffer(venc_, index);
}
void VEncAPI11Sample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
    }
}

void VEncAPI11Sample::StopInloop()
{
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        clearIntqueue(signal_->inIdxQueue_);
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        lock.unlock();

        inputLoop_->join();
        inputLoop_ = nullptr;
    }
}

void VEncAPI11Sample::testApi()
{
    OH_VideoEncoder_GetSurface(venc_, &nativeWindow);
    OH_VideoEncoder_Prepare(venc_);
    OH_VideoEncoder_GetInputDescription(venc_);
    OH_VideoEncoder_Start(venc_);
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_REQUEST_I_FRAME, 1);
    OH_VideoEncoder_SetParameter(venc_, format);
    OH_VideoEncoder_NotifyEndOfStream(venc_);
    OH_VideoEncoder_GetOutputDescription(venc_);
    OH_AVFormat_Destroy(format);
    OH_VideoEncoder_Flush(venc_);
    bool isValid = false;
    OH_VideoEncoder_IsValid(venc_, &isValid);
    OH_VideoEncoder_Stop(venc_);
    OH_VideoEncoder_Reset(venc_);
}

int32_t VEncAPI11Sample::CreateSurface()
{
    int32_t ret = 0;
    ret = OH_VideoEncoder_GetSurface(venc_, &nativeWindow);
    if (ret != AV_ERR_OK) {
        cout << "OH_VideoEncoder_GetSurface fail" << endl;
        return ret;
    }
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, GRAPHIC_PIXEL_FMT_YCBCR_420_SP);
    if (ret != AV_ERR_OK) {
        cout << "NativeWindowHandleOpt SET_FORMAT fail" << endl;
        return ret;
    }
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    if (ret != AV_ERR_OK) {
        cout << "NativeWindowHandleOpt SET_BUFFER_GEOMETRY fail" << endl;
        return ret;
    }
    return AV_ERR_OK;
}

void VEncAPI11Sample::GetStride()
{
    OH_AVFormat *format = OH_VideoEncoder_GetInputDescription(venc_);
    int32_t inputStride = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &inputStride);
    stride_ = inputStride;
    OH_AVFormat_Destroy(format);
}

int32_t VEncAPI11Sample::OpenFile()
{
    int32_t ret = AV_ERR_OK;
    inFile_ = make_unique<ifstream>();
    if (inFile_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        return AV_ERR_UNKNOWN;
    }
    inFile_->open(INP_DIR, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        ret = OpenFileFail();
    }
    return ret;
}

int32_t VEncAPI11Sample::StartVideoEncoder()
{
    isRunning_.store(true);
    int32_t ret = 0;
    if (SURF_INPUT) {
        ret = CreateSurface();
        if (ret != AV_ERR_OK) {
            return ret;
        }
    }
    ret = OH_VideoEncoder_Start(venc_);
    GetStride();
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec" << endl;
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        signal_->outCond_.notify_all();
        return ret;
    }
    inFile_ = make_unique<ifstream>();
    if (inFile_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        return AV_ERR_UNKNOWN;
    }
    readMultiFilesFunc();
    if (SURF_INPUT) {
        inputLoop_ = make_unique<thread>(&VEncAPI11Sample::InputFuncSurface, this);
    } else {
        inputLoop_ = make_unique<thread>(&VEncAPI11Sample::InputFunc, this);
    }
    if (inputLoop_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }
    outputLoop_ = make_unique<thread>(&VEncAPI11Sample::OutputFunc, this);
    if (outputLoop_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        ReleaseInFile();
        StopInloop();
        Release();
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}

void VEncAPI11Sample::readMultiFilesFunc()
{
    if (!readMultiFiles) {
        inFile_->open(INP_DIR, ios::in | ios::binary);
        if (!inFile_->is_open()) {
            OpenFileFail();
        }
    }
}

int32_t VEncAPI11Sample::CreateVideoEncoder(const char *codecName)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (!strcmp(codecName, tmpCodecName)) {
        isAVCEncoder = true;
    } else {
        isAVCEncoder = false;
    }
    venc_ = OH_VideoEncoder_CreateByName(codecName);
    enc_sample = this;
    return venc_ == nullptr ? AV_ERR_UNKNOWN : AV_ERR_OK;
}

void VEncAPI11Sample::WaitForEOS()
{
    if (inputLoop_)
        inputLoop_->join();
    if (outputLoop_)
        outputLoop_->join();
    inputLoop_ = nullptr;
    outputLoop_ = nullptr;
}

uint32_t VEncAPI11Sample::ReturnZeroIfEOS(uint32_t expectedSize)
{
    if (inFile_->gcount() != (expectedSize)) {
        cout << "no more data" << endl;
        return 0;
    }
    return 1;
}

uint32_t VEncAPI11Sample::ReadOneFrameYUV420SP(uint8_t *dst)
{
    uint8_t *start = dst;
    // copy Y
    for (uint32_t i = 0; i < DEFAULT_HEIGHT; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH);
        if (!ReturnZeroIfEOS(DEFAULT_WIDTH))
            return 0;
        dst += stride_;
    }
    // copy UV
    for (uint32_t i = 0; i < DEFAULT_HEIGHT / SAMPLE_RATIO; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH);
        if (!ReturnZeroIfEOS(DEFAULT_WIDTH))
            return 0;
        dst += stride_;
    }
    return dst - start;
}

uint32_t VEncAPI11Sample::ReadOneFrameYUVP010(uint8_t *dst)
{
    uint8_t *start = dst;
    int32_t num = 2;
    // copy Y
    for (uint32_t i = 0; i < DEFAULT_HEIGHT; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH*num);
        if (!ReturnZeroIfEOS(DEFAULT_WIDTH*num))
            return 0;
        dst += stride_;
    }
    // copy UV
    for (uint32_t i = 0; i < DEFAULT_HEIGHT / SAMPLE_RATIO; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH*num);
        if (!ReturnZeroIfEOS(DEFAULT_WIDTH*num))
            return 0;
        dst += stride_;
    }
    return dst - start;
}

uint32_t VEncAPI11Sample::ReadOneFrameRGBA8888(uint8_t *dst)
{
    uint8_t *start = dst;
    for (uint32_t i = 0; i < DEFAULT_HEIGHT; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH * RGBA_SIZE);
        if (inFile_->eof())
            return 0;
        dst += stride_;
    }
    return dst - start;
}

uint32_t VEncAPI11Sample::FlushSurf(OHNativeWindowBuffer *ohNativeWindowBuffer, OH_NativeBuffer *nativeBuffer)
{
    int32_t ret = 0;
    struct Region region;
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0;
    rect->y = 0;
    rect->w = DEFAULT_WIDTH;
    rect->h = DEFAULT_HEIGHT;
    region.rects = rect;
    NativeWindowHandleOpt(nativeWindow, SET_UI_TIMESTAMP, GetSystemTimeUs());
    ret = OH_NativeBuffer_Unmap(nativeBuffer);
    if (ret != 0) {
        cout << "OH_NativeBuffer_Unmap failed" << endl;
        delete rect;
        return ret;
    }
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, ohNativeWindowBuffer, -1, region);
    delete rect;
    if (ret != 0) {
        cout << "FlushBuffer failed" << endl;
        return ret;
    }
    return ret;
}

void VEncAPI11Sample::InputFuncSurface()
{
    int32_t readFileIndex = 0;
    while (true) {
        OHNativeWindowBuffer *ohNativeWindowBuffer;
        OH_NativeBuffer *nativeBuffer = nullptr;
        uint8_t *dst = nullptr;
        int err = InitBuffer(ohNativeWindowBuffer, nativeBuffer, dst);
        if (err == 0) {
            break;
        } else if (err == -1) {
            continue;
        }
        if (readMultiFiles) {
            err = ReadOneFrameFromList(dst, readFileIndex);
            if (err == LOOP_END) {
                break;
            } else if (err == FILE_END) {
                OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, ohNativeWindowBuffer);
                cout << "OH_NativeWindow_NativeWindowAbortBuffer" << endl;
                continue;
            }
        } else if (!ReadOneFrameYUV420SP(dst)) {
            err = OH_VideoEncoder_NotifyEndOfStream(venc_);
            if (err != 0) {
                cout << "OH_VideoEncoder_NotifyEndOfStream failed" << endl;
            }
            break;
        }
        err = FlushSurf(ohNativeWindowBuffer, nativeBuffer);
        if (err != 0) {
            break;
        }
        usleep(FRAME_INTERVAL);
    }
}

int32_t VEncAPI11Sample::InitBuffer(OHNativeWindowBuffer *&ohNativeWindowBuffer,
    OH_NativeBuffer *&nativeBuffer, uint8_t *&dst)
{
    int fenceFd = -1;
    if (nativeWindow == nullptr) {
        return 0;
    }
    int32_t err = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &ohNativeWindowBuffer, &fenceFd);
    if (err != 0) {
        cout << "RequestBuffer failed, GSError=" << err << endl;
        return -1;
    }
    if (fenceFd > 0) {
        close(fenceFd);
    }
    nativeBuffer = OH_NativeBufferFromNativeWindowBuffer(ohNativeWindowBuffer);
    void *virAddr = nullptr;
    err = OH_NativeBuffer_Map(nativeBuffer, &virAddr);
    if (err != 0) {
        cout << "OH_NativeBuffer_Map failed, GSError=" << err << endl;
        isRunning_.store(false);
        return 0;
    }
    dst = (uint8_t *)virAddr;
    const SurfaceBuffer *sbuffer = SurfaceBuffer::NativeBufferToSurfaceBuffer(nativeBuffer);
    int32_t stride = sbuffer->GetStride();
    if (dst == nullptr || stride < (int32_t)DEFAULT_WIDTH) {
        cout << "invalid va or stride=" << stride << endl;
        err = NativeWindowCancelBuffer(nativeWindow, ohNativeWindowBuffer);
        isRunning_.store(false);
        return 0;
    }
    stride_ = stride;
    return 1;
}

uint32_t VEncAPI11Sample::ReadOneFrameFromList(uint8_t *dst, int32_t &index)
{
    int32_t ret = 0;
    if (index >= fileInfos.size()) {
        ret = OH_VideoEncoder_NotifyEndOfStream(venc_);
        if (ret != 0) {
            cout << "OH_VideoEncoder_NotifyEndOfStream failed" << endl;
        }
        return LOOP_END;
    }
    if (!inFile_->is_open()) {
        inFile_->open(fileInfos[index].fileDir);
        if (!inFile_->is_open()) {
            return OpenFileFail();
        }
        DEFAULT_WIDTH = fileInfos[index].width;
        DEFAULT_HEIGHT = fileInfos[index].height;
        if (setFormatRbgx) {
            ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, GRAPHIC_PIXEL_FMT_RGBX_8888);
        } else if (setFormat8Bit) {
            ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, GRAPHIC_PIXEL_FMT_YCBCR_420_SP);
        } else if (setFormat10Bit) {
            ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, GRAPHIC_PIXEL_FMT_YCBCR_P010);
        } else {
            ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, fileInfos[index].format);
        }
        if (ret != AV_ERR_OK) {
            return ret;
        }
        ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
        if (ret != AV_ERR_OK) {
            return ret;
        }
        cout << fileInfos[index].fileDir << endl;
        cout << "set width:" << fileInfos[index].width << "height: " << fileInfos[index].height << endl;
        return FILE_END;
    }
    ret = ReadOneFrameByType(dst, fileInfos[index].format);
    if (!ret) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        index++;
        if (index >= fileInfos.size()) {
            OH_VideoEncoder_NotifyEndOfStream(venc_);
            return LOOP_END;
        }
        return FILE_END;
    }
    return ret;
}

uint32_t VEncAPI11Sample::ReadOneFrameByType(uint8_t *dst, OH_NativeBuffer_Format format)
{
    if (format == NATIVEBUFFER_PIXEL_FMT_RGBA_8888) {
        return ReadOneFrameRGBA8888(dst);
    } else if (format == NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP || format == NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP) {
        return ReadOneFrameYUV420SP(dst);
    } else if (format == NATIVEBUFFER_PIXEL_FMT_YCBCR_P010) {
        return ReadOneFrameYUVP010(dst);
    } else {
        cout << "error fileType" << endl;
        return 0;
    }
}

int32_t VEncAPI11Sample::OpenFileFail()
{
    cout << "file open fail" << endl;
    isRunning_.store(false);
    (void)OH_VideoEncoder_Stop(venc_);
    inFile_->close();
    inFile_.reset();
    inFile_ = nullptr;
    return AV_ERR_UNKNOWN;
}

void VEncAPI11Sample::Flush_buffer()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    std::queue<OH_AVBuffer *> empty;
    swap(empty, signal_->inBufferQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
}

void VEncAPI11Sample::RepeatStartBeforeEOS()
{
    if (REPEAT_START_FLUSH_BEFORE_EOS > 0) {
        REPEAT_START_FLUSH_BEFORE_EOS--;
        OH_VideoEncoder_Flush(venc_);
        Flush_buffer();
        OH_VideoEncoder_Start(venc_);
    }
    
    if (REPEAT_START_STOP_BEFORE_EOS > 0) {
        REPEAT_START_STOP_BEFORE_EOS--;
        OH_VideoEncoder_Stop(venc_);
        Flush_buffer();
        OH_VideoEncoder_Start(venc_);
    }
}

bool VEncAPI11Sample::RandomEOS(uint32_t index)
{
    uint32_t random_eos = rand() % 25;
    if (enable_random_eos && random_eos == frameCount) {
        OH_VideoEncoder_NotifyEndOfStream(venc_);
        cout << "random eos" << endl;
        frameCount++;
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inIdxQueue_.pop();
        signal_->inBufferQueue_.pop();
        return true;
    }
    return false;
}

void VEncAPI11Sample::AutoSwitchParam()
{
    int64_t currentBitrate = DEFAULT_BITRATE;
    double currentFrameRate = DEFAULT_FRAME_RATE;
    int32_t currentQP = DEFAULT_QP;
    if (frameCount == switchParamsTimeSec * (int32_t)DEFAULT_FRAME_RATE) {
        OH_AVFormat *format = OH_AVFormat_Create();
        if (needResetBitrate) {
            currentBitrate = DEFAULT_BITRATE >> 1;
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, currentBitrate);
        }
        if (needResetFrameRate) {
            currentFrameRate = DEFAULT_FRAME_RATE * DOUBLE;
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, currentFrameRate);
        }
        if (needResetQP) {
            currentQP = DEFAULT_QP;
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, currentQP);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, currentQP);
        }
        SetParameter(format) == AV_ERR_OK ? (0) : (errCount++);
        OH_AVFormat_Destroy(format);
    }
    if (frameCount == switchParamsTimeSec * (int32_t)DEFAULT_FRAME_RATE * DOUBLE) {
        OH_AVFormat *format = OH_AVFormat_Create();
        if (needResetBitrate) {
            currentBitrate = DEFAULT_BITRATE << 1;
            cout<<"switch bitrate "<< currentBitrate;
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, currentBitrate);
        }
        if (needResetFrameRate) {
            currentFrameRate = DEFAULT_FRAME_RATE / DOUBLE;
            cout<< "switch framerate" << currentFrameRate << endl;
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, currentFrameRate);
        }
        if (needResetQP) {
            currentQP = DEFAULT_QP * DOUBLE;
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, currentQP);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, currentQP);
        }
        SetParameter(format) == AV_ERR_OK ? (0) : (errCount++);
        OH_AVFormat_Destroy(format);
    }
}

void VEncAPI11Sample::SetEOS(uint32_t index, OH_AVBuffer *buffer)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    OH_AVBuffer_SetBufferAttr(buffer, &attr);
    int32_t res = OH_VideoEncoder_PushInputBuffer(venc_, index);
    cout << "OH_VideoEncoder_PushInputBuffer    EOS   res: " << res << endl;
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
}

void VEncAPI11Sample::SetForceIDR()
{
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_REQUEST_I_FRAME, 1);
    OH_VideoEncoder_SetParameter(venc_, format);
    OH_AVFormat_Destroy(format);
}

void VEncAPI11Sample::SetLTRParameter(OH_AVBuffer *buffer)
{
    if (!ltrParam.enableUseLtr) {
        return;
    }
    OH_AVFormat *format = OH_AVFormat_Create();
    if (frameCount % ltrParam.ltrInterval == 0) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_MARK_LTR, 1);
    }
    if (!ltrParam.enableUseLtr) {
        OH_AVBuffer_SetParameter(buffer, format) == AV_ERR_OK ? (0) : (errCount++);
        OH_AVFormat_Destroy(format);
        return;
    }
    static int32_t useLtrIndex = 0;
    if (ltrParam.useLtrIndex == 0) {
        useLtrIndex = LTR_INTERVAL;
    } else if (ltrParam.useBadLtr) {
        useLtrIndex = BADPOC;
    } else {
        uint32_t interval = ltrParam.ltrInterval;
        if (interval > 0 && frameCount > 0 && (frameCount % interval == 0)) {
            useLtrIndex = frameCount / interval * interval;
        }
    }
    if (frameCount > useLtrIndex) {
        if (!ltrParam.useLtrOnce) {
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, useLtrIndex);
        } else {
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, useLtrIndex);
            ltrParam.useLtrOnce = true;
        }
    } else if (frameCount == useLtrIndex && frameCount > 0) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, useLtrIndex - ltrParam.ltrInterval);
    }
    OH_AVBuffer_SetParameter(buffer, format) == AV_ERR_OK ? (0) : (errCount++);
    OH_AVFormat_Destroy(format);
}

void VEncAPI11Sample::SetBufferParameter(OH_AVBuffer *buffer)
{
    int32_t currentQP = DEFAULT_QP;
    if (!enableAutoSwitchBufferParam) {
        return;
    }
    if (frameCount == switchParamsTimeSec * (int32_t)DEFAULT_FRAME_RATE) {
        OH_AVFormat *format = OH_AVFormat_Create();
        if (needResetQP) {
            currentQP = DEFAULT_QP;
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, currentQP);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, currentQP);
        }
        OH_AVBuffer_SetParameter(buffer, format) == AV_ERR_OK ? (0) : (errCount++);
        OH_AVFormat_Destroy(format);
    }
    if (frameCount == switchParamsTimeSec * (int32_t)DEFAULT_FRAME_RATE * DOUBLE) {
        OH_AVFormat *format = OH_AVFormat_Create();
        if (needResetQP) {
            currentQP = DEFAULT_QP * DOUBLE;
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, currentQP);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, currentQP);
        }
        OH_AVBuffer_SetParameter(buffer, format) == AV_ERR_OK ? (0) : (errCount++);
        OH_AVFormat_Destroy(format);
    }
}

int32_t VEncAPI11Sample::PushData(OH_AVBuffer *buffer, uint32_t index, int32_t &result)
{
    int32_t res = -2;
    OH_AVCodecBufferAttr attr;
    uint8_t *fileBuffer = OH_AVBuffer_GetAddr(buffer);
    if (fileBuffer == nullptr) {
        cout << "Fatal: no memory" << endl;
        return -1;
    }
    int32_t size = OH_AVBuffer_GetCapacity(buffer);
    if (DEFAULT_PIX_FMT == AV_PIXEL_FORMAT_RGBA) {
        if (size < DEFAULT_HEIGHT * stride_) {
            return -1;
        }
        attr.size = ReadOneFrameRGBA8888(fileBuffer);
    } else {
        if (size < (DEFAULT_HEIGHT * stride_ + (DEFAULT_HEIGHT * stride_ / DOUBLE))) {
            return -1;
        }
        attr.size = ReadOneFrameYUV420SP(fileBuffer);
    }
    if (repeatRun && inFile_->eof()) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        encode_count++;
        cout << "repeat"<< "   encode_count:" << encode_count << endl;
        return -1;
    }
    if (inFile_->eof()) {
        SetEOS(index, buffer);
        return 0;
    }
    attr.pts = GetSystemTimeUs();
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    if (enableForceIDR && (frameCount % IDR_FRAME_INTERVAL == 0)) {
        SetForceIDR();
    }
    OH_AVBuffer_SetBufferAttr(buffer, &attr);
    SetBufferParameter(buffer);
    SetLTRParameter(buffer);
    result = OH_VideoEncoder_PushInputBuffer(venc_, index);
    frameCount++;
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
    return res;
}

int32_t VEncAPI11Sample::CheckResult(bool isRandomEosSuccess, int32_t pushResult)
{
    if (isRandomEosSuccess) {
        if (pushResult == 0) {
            errCount = errCount + 1;
            cout << "push input after eos should be failed!  pushResult:" << pushResult << endl;
        }
        return -1;
    } else if (pushResult != 0) {
        errCount = errCount + 1;
        cout << "push input data failed, error:" << pushResult << endl;
        return -1;
    }
    return 0;
}

void VEncAPI11Sample::InputFunc()
{
    errCount = 0;
    while (true) {
        if (!isRunning_.load()) {
            break;
        }
        RepeatStartBeforeEOS();
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->inIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->inIdxQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        lock.unlock();
        if (!inFile_->eof()) {
            bool isRandomEosSuccess = RandomEOS(index);
            if (isRandomEosSuccess) {
                continue;
            }
            int32_t pushResult = 0;
            int32_t ret = PushData(buffer, index, pushResult);
            if (ret == 0) {
                break;
            } else if (ret == -1) {
                continue;
            }
            if (CheckResult(isRandomEosSuccess, pushResult) == -1) {
                break;
            }
            if (enableAutoSwitchParam) {
                AutoSwitchParam();
            }
        }
        if (sleepOnFPS) {
            usleep(FRAME_INTERVAL);
        }
    }
}

int32_t VEncAPI11Sample::CheckAttrFlag(OH_AVCodecBufferAttr attr)
{
    if (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        cout << "attr.flags == AVCODEC_BUFFER_FLAGS_EOS" << endl;
        unique_lock<mutex> inLock(signal_->inMutex_);
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        signal_->outCond_.notify_all();
        inLock.unlock();
        return -1;
    }
    if (attr.flags == AVCODEC_BUFFER_FLAGS_CODEC_DATA) {
        cout << "enc AVCODEC_BUFFER_FLAGS_CODEC_DATA" << attr.pts << endl;
        return 0;
    }
    outCount = outCount + 1;
    return 0;
}

void VEncAPI11Sample::OutputFuncFail()
{
    cout << "errCount > 0" << endl;
    unique_lock<mutex> inLock(signal_->inMutex_);
    isRunning_.store(false);
    signal_->inCond_.notify_all();
    signal_->outCond_.notify_all();
    inLock.unlock();
    (void)Stop();
    Release();
}

void VEncAPI11Sample::OutputFunc()
{
    FILE *outFile = fopen(OUT_DIR, "wb");
    while (true) {
        if (!isRunning_.load()) {
            break;
        }
        OH_AVCodecBufferAttr attr;
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->outIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->outIdxQueue_.front();
        OH_AVBuffer *buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        lock.unlock();
        DumpInfo(attr, buffer);
        if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
            errCount = errCount + 1;
        }
        if (CheckAttrFlag(attr) == -1) {
            break;
        }
        int size = attr.size;
        if (outFile == nullptr) {
            cout << "dump data fail" << endl;
        } else {
            fwrite(OH_AVBuffer_GetAddr(buffer), 1, size, outFile);
        }
        if (OH_VideoEncoder_FreeOutputBuffer(venc_, index) != AV_ERR_OK) {
            cout << "Fatal: ReleaseOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
        if (errCount > 0) {
            OutputFuncFail();
            break;
        }
    }
    if (outFile) {
        (void)fclose(outFile);
    }
}

int32_t VEncAPI11Sample::Flush()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
    return OH_VideoEncoder_Flush(venc_);
}

int32_t VEncAPI11Sample::Reset()
{
    isRunning_.store(false);
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoEncoder_Reset(venc_);
}

int32_t VEncAPI11Sample::Release()
{
    int ret = OH_VideoEncoder_Destroy(venc_);
    venc_ = nullptr;
    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
    return ret;
}

int32_t VEncAPI11Sample::Stop()
{
    StopInloop();
    clearIntqueue(signal_->outIdxQueue_);
    ReleaseInFile();
    return OH_VideoEncoder_Stop(venc_);
}

int32_t VEncAPI11Sample::Start()
{
    return OH_VideoEncoder_Start(venc_);
}

void VEncAPI11Sample::StopOutloop()
{
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        unique_lock<mutex> lock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        signal_->outCond_.notify_all();
        lock.unlock();
    }
}

int32_t VEncAPI11Sample::SetParameter(OH_AVFormat *format)
{
    if (venc_) {
        return OH_VideoEncoder_SetParameter(venc_, format);
    }
    return AV_ERR_UNKNOWN;
}