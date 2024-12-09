/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <vector>
#include <mutex>
#include <gtest/gtest.h>
#include <iostream>
#include <unistd.h>
#include <atomic>
#include <fstream>
#include <queue>
#include <string>
#include <thread>
#include "avcodec_codec_name.h"
#include "avcodec_mime_type.h"
#include "avcodec_common.h"
#include "media_description.h"
#include "native_avformat.h"
#include "avcodec_errors.h"
#include "native_avcodec_audioencoder.h"
#include "native_avcodec_audiocodec.h"
#include "native_avcodec_base.h"
#include "native_avcapability.h"
#include "native_avbuffer.h"
#include "native_audio_channel_layout.h"
#include "securec.h"
#include "ffmpeg_converter.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS::MediaAVCodec;

namespace {
const string CODEC_FLAC_NAME = std::string(AVCodecCodecName::AUDIO_ENCODER_FLAC_NAME);
const string CODEC_AAC_NAME = std::string(AVCodecCodecName::AUDIO_ENCODER_AAC_NAME);
const string CODEC_OPUS_NAME = std::string(AVCodecCodecName::AUDIO_ENCODER_OPUS_NAME);
const string CODEC_G711MU_NAME = std::string(AVCodecCodecName::AUDIO_ENCODER_G711MU_NAME);

constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t ABNORMAL_CHANNEL_COUNT = 10;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr uint32_t ABNORMAL_SAMPLE_RATE = 9999999;
constexpr int64_t BITS_RATE = 261000;
constexpr int64_t ABNORMAL_BITS_RATE = -1;
constexpr int32_t BITS_PER_CODED_SAMPLE = AudioSampleFormat::SAMPLE_S16LE;
constexpr int32_t ABNORMAL_BITS_SAMPLE = AudioSampleFormat::INVALID_WIDTH;
constexpr uint32_t FRAME_DURATION_US = 33000;
constexpr uint64_t CHANNEL_LAYOUT = AudioChannelLayout::STEREO;
constexpr uint64_t ABNORMAL_CHANNEL_LAYOUT = AudioChannelLayout::CH_10POINT2;
constexpr int32_t SAMPLE_FORMAT = AudioSampleFormat::SAMPLE_S16LE;
constexpr uint32_t FLAC_DEFAULT_FRAME_BYTES = 18432;
constexpr uint32_t AAC_DEFAULT_FRAME_BYTES = 2 * 1024 * 4;
constexpr uint32_t G711MU_DEFAULT_FRAME_BYTES = 320; // 8kHz 20ms: 2*160
constexpr uint32_t G711MU_SAMPLE_RATE = 8000;
constexpr uint32_t G711MU_CHANNEL_COUNT = 1;
constexpr uint32_t ILLEGAL_CHANNEL_COUNT = 9;
constexpr uint32_t ILLEGAL_SAMPLE_RATE = 441000;
constexpr int32_t COMPLIANCE_LEVEL = 0;
constexpr int32_t ABNORMAL_COMPLIANCE_LEVEL_L = -9999999;
constexpr int32_t ABNORMAL_COMPLIANCE_LEVEL_R = 9999999;
constexpr int32_t MAX_INPUT_SIZE = 8192;
constexpr uint32_t OPUS_CHANNEL_COUNT = 2;
constexpr uint32_t OPUS_SAMPLE_RATE = 48000;
constexpr long OPUS_BITS_RATE = 15000;
constexpr int32_t OPUS_COMPLIANCE_LEVEL = 10;
constexpr int32_t OPUS_FRAME_SAMPLE_SIZES = 960 * 2 * 2;

constexpr string_view OPUS_INPUT_FILE_PATH = "/data/test/media/flac_2c_44100hz_261k.pcm";
constexpr string_view OPUS_OUTPUT_FILE_PATH = "/data/test/media/encoderTest.opus";
constexpr string_view FLAC_INPUT_FILE_PATH = "/data/test/media/flac_2c_44100hz_261k.pcm";
constexpr string_view FLAC_OUTPUT_FILE_PATH = "/data/test/media/encoderTest.flac";

constexpr string_view AAC_INPUT_FILE_PATH = "/data/test/media/aac_2c_44100hz_199k.pcm";
constexpr string_view AAC_OUTPUT_FILE_PATH = "/data/test/media/aac_2c_44100hz_encode.aac";
const string OPUS_SO_FILE_PATH = std::string(AV_CODEC_PATH) + "/libav_codec_ext_base.z.so";

constexpr string_view G711MU_INPUT_FILE_PATH = "/data/test/media/g711mu_8kHz_10s.pcm";
constexpr string_view G711MU_OUTPUT_FILE_PATH = "/data/test/media/g711mu_8kHz_10s_afterEncode.raw";
} // namespace

namespace OHOS {
namespace MediaAVCodec {
class AEncSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVMemory *> inBufferQueue_;
    std::queue<OH_AVMemory *> outBufferQueue_;
    std::queue<OH_AVCodecBufferAttr> attrQueue_;
};

class AEncSignalAv {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex startMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::condition_variable startCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVBuffer*> inBufferQueue_;
    std::queue<OH_AVBuffer*> outBufferQueue_;
};

static void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
    cout << "Error received, errorCode:" << errorCode << endl;
}

static void OnOutputFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
    cout << "OnOutputFormatChanged received" << endl;
}

static void OnInputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    (void)codec;
    AEncSignal *signal = static_cast<AEncSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr,
                                    void *userData)
{
    (void)codec;
    AEncSignal *signal = static_cast<AEncSignal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    if (attr) {
        signal->attrQueue_.push(*attr);
    } else {
        cout << "OnOutputBufferAvailable error, attr is nullptr!" << endl;
    }
    signal->outCond_.notify_all();
}

static void OnInputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    AEncSignalAv *signal = static_cast<AEncSignalAv *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    AEncSignalAv *signal = static_cast<AEncSignalAv *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    if (data) {
    } else {
        cout << "OnOutputBufferAvailable error, attr is nullptr!" << endl;
    }
    signal->outCond_.notify_all();
}

class AudioCodeCapiEncoderUnitTest : public testing::Test {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
    int32_t ProceFunc(const std::string codecName = CODEC_FLAC_NAME);
    int32_t ProceByMimeFunc(const std::string mime, bool isEncoder);
    int32_t ProceByCapabilityFunc(const std::string mime, bool isEncoder);
    int32_t CheckSoFunc();
    void InputFunc();
    void OutputFunc();
    void InputFuncAv();
    void OutputFuncAv();
    void HeAACSampleRateTest(int32_t profile);
    void ChannelLayoutTest(map<OH_AudioChannelLayout, int32_t> &supportedLayoutMap,
                           map<OH_AudioChannelLayout, int32_t> &unsupportedLayoutMap,
                           int32_t profile);
    void ChannelCountTest(set<int32_t> &supportedChannelCntSet,
                          set<int32_t> &unsupportedChannelCntSet,
                          int32_t profile);
protected:
    std::atomic<bool> isRunning_ = false;
    std::unique_ptr<std::ifstream> inputFile_;
    std::unique_ptr<std::ifstream> soFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    int32_t index_;
    uint32_t frameBytes_ = FLAC_DEFAULT_FRAME_BYTES; // default for flac
    std::string inputFilePath_ = FLAC_INPUT_FILE_PATH.data();
    std::string outputFilePath_ = FLAC_OUTPUT_FILE_PATH.data();

    struct OH_AVCodecAsyncCallback cb_;
    struct OH_AVCodecCallback avcb_;
    AEncSignal *signal_ = nullptr;
    AEncSignalAv *signalAv_ = nullptr;
    OH_AVCodec *audioEnc_;
    OH_AVFormat *format;
    bool isFirstFrame_ = true;
    int64_t timeStamp_ = 0;
};

void AudioCodeCapiEncoderUnitTest::SetUpTestCase(void)
{
    cout << "[SetUpTestCase]: " << endl;
}

void AudioCodeCapiEncoderUnitTest::TearDownTestCase(void)
{
    cout << "[TearDownTestCase]: " << endl;
}

void AudioCodeCapiEncoderUnitTest::SetUp(void)
{
    cout << "[SetUp]: SetUp!!!" << endl;
}

void AudioCodeCapiEncoderUnitTest::TearDown(void)
{
    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
    if (signalAv_ != nullptr) {
        delete signalAv_;
        signalAv_ = nullptr;
    }
    cout << "[TearDown]: over!!!" << endl;
}

void AudioCodeCapiEncoderUnitTest::InputFunc()
{
    OH_AVCodecBufferAttr info = {};
    bool isEos = false;
    inputFile_ = std::make_unique<std::ifstream>(inputFilePath_, std::ios::binary);
    if (!inputFile_->is_open()) {
        std::cout << "open file failed, path: " << inputFilePath_ << std::endl;
        return;
    }
    while (isRunning_.load()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() { return (signal_->inQueue_.size() > 0 || !isRunning_.load()); });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->inQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        isEos = !inputFile_->eof();
        if (!isEos) {
            inputFile_->read((char *)OH_AVMemory_GetAddr(buffer), frameBytes_);
        }
        info.size = frameBytes_;
        info.flags = AVCODEC_BUFFER_FLAGS_NONE;
        if (isEos) {
            info.size = 0;
            info.flags = AVCODEC_BUFFER_FLAGS_EOS;
        } else if (isFirstFrame_) {
            info.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            isFirstFrame_ = false;
        }
        info.offset = 0;
        int32_t ret = OH_AudioEncoder_PushInputData(audioEnc_, index, info);
        signal_->inQueue_.pop();
        signal_->inBufferQueue_.pop();
        if (ret != AVCS_ERR_OK) {
            isRunning_ = false;
            break;
        }
        if (isEos) {
            break;
        }
        timeStamp_ += FRAME_DURATION_US;
    }
    inputFile_->close();
}

void AudioCodeCapiEncoderUnitTest::OutputFunc()
{
    std::ofstream outputFile;
    outputFile.open(outputFilePath_, std::ios::out | std::ios::binary);
    if (!outputFile.is_open()) {
        std::cout << "open file failed, path: " << outputFilePath_ << std::endl;
        return;
    }

    while (isRunning_.load()) {
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() { return (signal_->outQueue_.size() > 0 || !isRunning_.load()); });

        if (!isRunning_.load()) {
            cout << "wait to stop, exit" << endl;
            break;
        }

        uint32_t index = signal_->outQueue_.front();

        OH_AVCodecBufferAttr attr = signal_->attrQueue_.front();
        OH_AVMemory *data = signal_->outBufferQueue_.front();
        if (data != nullptr) {
            outputFile.write(reinterpret_cast<char *>(OH_AVMemory_GetAddr(data)), attr.size);
        }
        if (attr.flags == AVCODEC_BUFFER_FLAGS_EOS || attr.size == 0) {
            cout << "encode eos" << endl;
            isRunning_.store(false);
        }

        signal_->outBufferQueue_.pop();
        signal_->attrQueue_.pop();
        signal_->outQueue_.pop();
        if (OH_AudioEncoder_FreeOutputData(audioEnc_, index) != AV_ERR_OK) {
            cout << "Fatal: FreeOutputData fail" << endl;
            break;
        }
    }
    outputFile.close();
}

int32_t AudioCodeCapiEncoderUnitTest::ProceFunc(const std::string codecName)
{
    audioEnc_ = OH_AudioEncoder_CreateByName(codecName.c_str());
    EXPECT_NE((OH_AVCodec *)nullptr, audioEnc_);

    signal_ = new AEncSignal();
    EXPECT_NE(nullptr, signal);

    cb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable};
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_SetCallback(audioEnc_, cb_, signal_));

    format = OH_AVFormat_Create();
    return AVCS_ERR_OK;
}

int32_t AudioCodeCapiEncoderUnitTest::ProceByMimeFunc(const std::string mime, bool isEncoder)
{
    audioEnc_ = OH_AudioCodec_CreateByMime(mime.c_str(), isEncoder);
    EXPECT_NE((OH_AVCodec *)nullptr, audioEnc_);

    signalAv_ = new AEncSignalAv();
    EXPECT_NE(nullptr, signal);

    avcb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv};
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_));

    format = OH_AVFormat_Create();
    return AVCS_ERR_OK;
}

int32_t AudioCodeCapiEncoderUnitTest::ProceByCapabilityFunc(const std::string mime, bool isEncoder)
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(mime.c_str(), isEncoder);
    const char *name = OH_AVCapability_GetName(cap);
    audioEnc_ = OH_AudioCodec_CreateByName(name);
    EXPECT_NE((OH_AVCodec *)nullptr, audioEnc_);

    signalAv_ = new AEncSignalAv();
    EXPECT_NE(nullptr, signal);

    avcb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv};
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_));

    format = OH_AVFormat_Create();
    return AVCS_ERR_OK;
}

void AudioCodeCapiEncoderUnitTest::InputFuncAv()
{
    OH_AVCodecBufferAttr info = {};
    bool isEos = false;
    inputFile_ = std::make_unique<std::ifstream>(inputFilePath_, std::ios::binary);
    if (!inputFile_->is_open()) {
        std::cout << "open file failed, path: " << inputFilePath_ << std::endl;
        return;
    }
    while (isRunning_.load()) {
        unique_lock<mutex> lock(signalAv_->inMutex_);
        signalAv_->inCond_.wait(lock, [this]() { return (signalAv_->inQueue_.size() > 0 || !isRunning_.load()); });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signalAv_->inQueue_.front();
        auto buffer = signalAv_->inBufferQueue_.front();
        isEos = !inputFile_->eof();
        if (!isEos) {
            inputFile_->read((char *)OH_AVBuffer_GetAddr(buffer), frameBytes_);
        }
        info.size = frameBytes_;
        info.flags = AVCODEC_BUFFER_FLAGS_NONE;
        if (isEos) {
            info.size = 0;
            info.flags = AVCODEC_BUFFER_FLAGS_EOS;
        } else if (isFirstFrame_) {
            info.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            isFirstFrame_ = false;
        }
        info.offset = 0;
        OH_AVBuffer_SetBufferAttr(buffer, &info);
        int32_t ret = OH_AudioCodec_PushInputBuffer(audioEnc_, index);
        signalAv_->inQueue_.pop();
        signalAv_->inBufferQueue_.pop();
        if (ret != AVCS_ERR_OK) {
            isRunning_ = false;
            break;
        }
        if (isEos) {
            break;
        }
        timeStamp_ += FRAME_DURATION_US;
    }
    inputFile_->close();
}

void AudioCodeCapiEncoderUnitTest::OutputFuncAv()
{
    std::ofstream outputFile;
    outputFile.open(outputFilePath_, std::ios::out | std::ios::binary);
    if (!outputFile.is_open()) {
        std::cout << "open file failed, path: " << outputFilePath_ << std::endl;
        return;
    }

    while (isRunning_.load()) {
        unique_lock<mutex> lock(signalAv_->outMutex_);
        signalAv_->outCond_.wait(lock, [this]() { return (signalAv_->outQueue_.size() > 0 || !isRunning_.load()); });

        if (!isRunning_.load()) {
            cout << "wait to stop, exit" << endl;
            break;
        }

        uint32_t index = signalAv_->outQueue_.front();
        auto *data = signalAv_->outBufferQueue_.front();
        OH_AVCodecBufferAttr attr;
        OH_AVBuffer_GetBufferAttr(data, &attr);
        if (data != nullptr) {
            outputFile.write(reinterpret_cast<char *>(OH_AVBuffer_GetAddr(data)), attr.size);
        }
        if (data != nullptr && (attr.flags == AVCODEC_BUFFER_FLAGS_EOS || attr.size == 0)) {
            cout << "encode eos" << endl;
            isRunning_.store(false);
            signalAv_->startCond_.notify_all();
        }
        signalAv_->outBufferQueue_.pop();
        signalAv_->outQueue_.pop();
        if (OH_AudioCodec_FreeOutputBuffer(audioEnc_, index) != AV_ERR_OK) {
            cout << "Fatal: FreeOutputData fail" << endl;
            break;
        }
    }
    outputFile.close();
}

int32_t AudioCodeCapiEncoderUnitTest::CheckSoFunc()
{
    soFile_ = std::make_unique<std::ifstream>(OPUS_SO_FILE_PATH, std::ios::binary);
    if (!soFile_->is_open()) {
        cout << "Fatal: Open so file failed" << endl;
        return false;
    }
    soFile_->close();
    return true;
}

void AudioCodeCapiEncoderUnitTest::HeAACSampleRateTest(int32_t profile)
{
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    set<uint32_t> supportedSampleRateSet = {
        16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000,
    };
    set<uint32_t> unsupportedSampleRateSet = {
        0, 4000, 8000, 11025, 12000, 441000,
    };
    for (const uint32_t rate : supportedSampleRateSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
    for (const uint32_t rate : unsupportedSampleRateSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

void AudioCodeCapiEncoderUnitTest::ChannelCountTest(set<int32_t> &supportedChannelCntSet,
                                                    set<int32_t> &unsupportedChannelCntSet,
                                                    int32_t profile)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    for (const int32_t cnt : supportedChannelCntSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, cnt);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
    for (const int32_t cnt : unsupportedChannelCntSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, cnt);
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

void AudioCodeCapiEncoderUnitTest::ChannelLayoutTest(map<OH_AudioChannelLayout, int32_t> &supportedLayoutMap,
                                                     map<OH_AudioChannelLayout, int32_t> &unsupportedLayoutMap,
                                                     int32_t profile)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    map<OH_AudioChannelLayout, int32_t>::iterator iter;
    for (iter = supportedLayoutMap.begin(); iter != supportedLayoutMap.end(); iter++) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, iter->second);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, iter->first);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
    for (iter = unsupportedLayoutMap.begin(); iter != unsupportedLayoutMap.end(); iter++) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, iter->second);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, iter->first);
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusCreateByName_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusCreateByName_02, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    audioEnc_ = OH_AudioEncoder_CreateByName((CODEC_OPUS_NAME).data());
    EXPECT_NE(nullptr, audioEnc_);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusCreateByMime_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    audioEnc_ = OH_AudioEncoder_CreateByMime((AVCodecMimeType::MEDIA_MIMETYPE_AUDIO_OPUS).data());
    EXPECT_NE(nullptr, audioEnc_);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusGetOutputDescription_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    EXPECT_NE(nullptr, OH_AudioEncoder_GetOutputDescription(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusIsValid_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    bool value = true;
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_IsValid(audioEnc_, &value));
}


HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusSetParameter_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_SetParameter(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusSetParameter_02, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_SetParameter(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusConfigure_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), 9999);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusConfigure_02, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), 12345);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusConfigure_03, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), 9999999);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusConfigure_04, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_F32LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusConfigure_05, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), 120);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}


HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_OpusConfigure_06, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));

    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), 100);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Opusnormalcase_01, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Opusnormalcase_02, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);
    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Stop(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Opusnormalcase_03, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Opusnormalcase_04, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    ProceFunc(CODEC_OPUS_NAME);
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }
    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, opusCheckChannelCount, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    ProceFunc(CODEC_OPUS_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), OPUS_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), OPUS_COMPLIANCE_LEVEL);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
        AudioSampleFormat::SAMPLE_S16LE);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing channel count
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));

    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), 9999);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, opusCheckSampleFormat, TestSize.Level1)
{
    if (!CheckSoFunc()) {
        return;
    }
    inputFilePath_ = OPUS_INPUT_FILE_PATH;
    outputFilePath_ = OPUS_OUTPUT_FILE_PATH;
    frameBytes_ = OPUS_FRAME_SAMPLE_SIZES;
    ProceFunc(CODEC_OPUS_NAME);
    
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), OPUS_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), OPUS_SAMPLE_RATE);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_U8);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_F32LE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_CreateByName_01, TestSize.Level1)
{
    audioEnc_ = OH_AudioEncoder_CreateByName((AVCodecCodecName::AUDIO_ENCODER_FLAC_NAME).data());
    EXPECT_NE(nullptr, audioEnc_);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_CreateByMime_01, TestSize.Level1)
{
    audioEnc_ = OH_AudioEncoder_CreateByMime((AVCodecMimeType::MEDIA_MIMETYPE_AUDIO_FLAC).data());
    EXPECT_NE(nullptr, audioEnc_);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Prepare_01, TestSize.Level1)
{
    ProceFunc();
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Prepare(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_GetOutputDescription_01, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    EXPECT_NE(nullptr, OH_AudioEncoder_GetOutputDescription(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_IsValid_01, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    bool value = true;
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_IsValid(audioEnc_, &value));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_SetParameter_01, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_SetParameter(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_SetParameter_02, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_SetParameter(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_01, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_02, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), ABNORMAL_CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    ASSERT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_03, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), ABNORMAL_BITS_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    ASSERT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_04, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), ABNORMAL_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    ASSERT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_05, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), ABNORMAL_BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    ASSERT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_07, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), ABNORMAL_COMPLIANCE_LEVEL_L);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));

    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), ABNORMAL_COMPLIANCE_LEVEL_R);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_Configure_08, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), ABNORMAL_SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    ASSERT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_normalcase_01, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_normalcase_02, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);
    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Stop(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_normalcase_03, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_normalcase_04, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }
    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, audioEncoder_normalcase_05, TestSize.Level1)
{
    ProceFunc();
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), BITS_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BITS_PER_CODED_SAMPLE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLIANCE_LEVEL);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, aacCheckChannelCount, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_AAC_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_F32LE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), ILLEGAL_CHANNEL_COUNT);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, aacCheckSampleFormat, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_AAC_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_U8);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_F32LE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, aacCheckSampleRate, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_AAC_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_F32LE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing sample rate

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), ILLEGAL_SAMPLE_RATE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal sample rate

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal sample rate

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, aacCheckChannelLayout, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_AAC_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), 2);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_F32LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CH_7POINT1);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // channel mismatch channel_layout

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_LAYOUT.data(), CHANNEL_LAYOUT);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal channel layout

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, aacCheckMaxinputSize, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_AAC_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), 2);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_F32LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_MAX_INPUT_SIZE.data(), MAX_INPUT_SIZE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));

    auto fmt = OH_AudioEncoder_GetOutputDescription(audioEnc_);
    EXPECT_NE(fmt, nullptr);
    OH_AVFormat_Destroy(fmt);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, invalidEncoderNames, TestSize.Level1)
{
    EXPECT_EQ(OH_AudioEncoder_CreateByName((AVCodecCodecName::AUDIO_DECODER_MP3_NAME).data()), nullptr);
    EXPECT_EQ(OH_AudioEncoder_CreateByName((AVCodecCodecName::AUDIO_DECODER_AAC_NAME).data()), nullptr);
    EXPECT_EQ(OH_AudioEncoder_CreateByName((AVCodecCodecName::AUDIO_DECODER_API9_AAC_NAME).data()), nullptr);
    EXPECT_EQ(OH_AudioEncoder_CreateByName((AVCodecCodecName::AUDIO_DECODER_VORBIS_NAME).data()), nullptr);
    EXPECT_EQ(OH_AudioEncoder_CreateByName((AVCodecCodecName::AUDIO_DECODER_FLAC_NAME).data()), nullptr);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, g711muCheckChannelCount, TestSize.Level1)
{
    inputFilePath_ = G711MU_INPUT_FILE_PATH;
    outputFilePath_ = G711MU_OUTPUT_FILE_PATH;
    frameBytes_ = G711MU_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_G711MU_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), G711MU_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_S16LE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), ILLEGAL_CHANNEL_COUNT);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), G711MU_CHANNEL_COUNT);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal channel count

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, g711muCheckSampleFormat, TestSize.Level1)
{
    inputFilePath_ = G711MU_INPUT_FILE_PATH;
    outputFilePath_ = G711MU_OUTPUT_FILE_PATH;
    frameBytes_ = G711MU_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_G711MU_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), G711MU_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), G711MU_SAMPLE_RATE);

    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_U8);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_S16LE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal sample format

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, g711muCheckSampleRate, TestSize.Level1)
{
    inputFilePath_ = G711MU_INPUT_FILE_PATH;
    outputFilePath_ = G711MU_OUTPUT_FILE_PATH;
    frameBytes_ = G711MU_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_G711MU_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), G711MU_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_S16LE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // missing sample rate

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), ILLEGAL_SAMPLE_RATE);
    EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // illegal sample rate

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Reset(audioEnc_));
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), G711MU_SAMPLE_RATE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format)); // normal sample rate

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, g711muNormal, TestSize.Level1)
{
    inputFilePath_ = G711MU_INPUT_FILE_PATH;
    outputFilePath_ = G711MU_OUTPUT_FILE_PATH;
    frameBytes_ = G711MU_DEFAULT_FRAME_BYTES;
    ProceFunc(CODEC_G711MU_NAME);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), G711MU_CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                            AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), G711MU_SAMPLE_RATE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFunc, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFunc, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioEncoder_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, EncoderConfigureLCAAC, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, EncoderConfigureHEAAC, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    bool vendorExist = (tmpCodec != nullptr);
    if (vendorExist) {
        OH_AudioCodec_Destroy(tmpCodec);
        tmpCodec = nullptr;
    }

    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    if (vendorExist) {
        EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    } else {
        EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
        return;
    }

    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, EncoderConfigureHEAACv2, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    bool vendorExist = (tmpCodec != nullptr);
    if (vendorExist) {
        OH_AudioCodec_Destroy(tmpCodec);
        tmpCodec = nullptr;
    }
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE_V2);
    if (vendorExist) {
        EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    } else {
        EXPECT_NE(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
        return;
    }
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, EncoderConfigureByCap, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    bool vendorExist = (tmpCodec != nullptr);
    ProceByCapabilityFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    if (vendorExist) {
        OH_AudioCodec_Destroy(tmpCodec);
        tmpCodec = nullptr;
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderUnitTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(OH_AVErrCode::AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, sample_rate, TestSize.Level1)
{
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    if (tmpCodec == nullptr) {
        return;
    }
    OH_AudioCodec_Destroy(tmpCodec);
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    HeAACSampleRateTest(AAC_PROFILE_HE);
    HeAACSampleRateTest(AAC_PROFILE_HE_V2);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, channel_count_v1, TestSize.Level1)
{
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    if (tmpCodec == nullptr) {
        return;
    }
    OH_AudioCodec_Destroy(tmpCodec);
    set<int32_t> supportedChannelCntSet = {1, 2, 3, 4, 5, 6, 8};
    set<int32_t> unsupportedChannelCntSet = {0, 7, 9};
    ChannelCountTest(supportedChannelCntSet, unsupportedChannelCntSet, AAC_PROFILE_HE);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, channel_count_v2, TestSize.Level1)
{
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    if (tmpCodec == nullptr) {
        return;
    }
    OH_AudioCodec_Destroy(tmpCodec);
    set<int32_t> supportedChannelCntSet = {2};
    set<int32_t> unsupportedChannelCntSet = {0, 1, 3, 4, 5, 6, 7, 8, 9};
    ChannelCountTest(supportedChannelCntSet, unsupportedChannelCntSet, AAC_PROFILE_HE_V2);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, channel_layout_v1, TestSize.Level1)
{
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    if (tmpCodec == nullptr) {
        return;
    }
    OH_AudioCodec_Destroy(tmpCodec);
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        {CH_LAYOUT_MONO, 1},
        {CH_LAYOUT_STEREO, 2},
        {CH_LAYOUT_SURROUND, 3},
        {CH_LAYOUT_4POINT0, 4},
        {CH_LAYOUT_5POINT0_BACK, 5},
        {CH_LAYOUT_5POINT1_BACK, 6},
        {CH_LAYOUT_7POINT1_WIDE_BACK, 8},
        {CH_LAYOUT_7POINT1, 8},
    };
    map<OH_AudioChannelLayout, int32_t> unsupportedLayoutMap = {
        {CH_LAYOUT_MONO, 2},
        {CH_LAYOUT_STEREO, 3},
        {CH_LAYOUT_SURROUND, 4},
        {CH_LAYOUT_4POINT0, 5},
        {CH_LAYOUT_5POINT0, 6},
        {CH_LAYOUT_5POINT1, 7},
        {CH_LAYOUT_7POINT1_WIDE, 3},
        {CH_LAYOUT_7POINT1, 3},
        {CH_LAYOUT_7POINT1_WIDE_BACK, 5},
        // below unsupport layout
        {CH_LAYOUT_2POINT1, 3},
        {CH_LAYOUT_4POINT1, 5},
        {CH_LAYOUT_QUAD_SIDE, 4},
        {CH_LAYOUT_QUAD, 4},
        {CH_LAYOUT_6POINT0, 6},
    };
    ChannelLayoutTest(supportedLayoutMap, unsupportedLayoutMap, AAC_PROFILE_HE);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, channel_layout_v2, TestSize.Level1)
{
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    if (tmpCodec == nullptr) {
        return;
    }
    OH_AudioCodec_Destroy(tmpCodec);
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        {CH_LAYOUT_STEREO, 2},
    };
    map<OH_AudioChannelLayout, int32_t> unsupportedLayoutMap = {
        {CH_LAYOUT_MONO, 1},
        {CH_LAYOUT_MONO, 2},
        {CH_LAYOUT_SURROUND, 3},
        {CH_LAYOUT_4POINT0, 4},
        {CH_LAYOUT_5POINT0, 5},
        {CH_LAYOUT_5POINT1, 6},
        {CH_LAYOUT_7POINT1_WIDE, 8},
        {CH_LAYOUT_7POINT1, 8},
        {CH_LAYOUT_7POINT1_WIDE_BACK, 8},
        {CH_LAYOUT_STEREO, 3},
        {CH_LAYOUT_SURROUND, 4},
        {CH_LAYOUT_4POINT0, 5},
        {CH_LAYOUT_5POINT0, 6},
        {CH_LAYOUT_5POINT1, 7},
        {CH_LAYOUT_7POINT1_WIDE, 3},
        {CH_LAYOUT_7POINT1, 3},
        {CH_LAYOUT_7POINT1_WIDE_BACK, 5},
        // below unsupport layout
        {CH_LAYOUT_2POINT1, 3},
        {CH_LAYOUT_4POINT1, 5},
        {CH_LAYOUT_QUAD_SIDE, 4},
        {CH_LAYOUT_QUAD, 4},
        {CH_LAYOUT_6POINT0, 6},
    };
    ChannelLayoutTest(supportedLayoutMap, unsupportedLayoutMap, AAC_PROFILE_HE_V2);
}

HWTEST_F(AudioCodeCapiEncoderUnitTest, aac_profile, TestSize.Level1)
{
    OH_AVCodec *tmpCodec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Vendor.AAC");
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioSampleFormat::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    set<int32_t> supportedAacProfile = {AAC_PROFILE_LC};
    if (tmpCodec != nullptr) {
        OH_AudioCodec_Destroy(tmpCodec);
        supportedAacProfile = {AAC_PROFILE_LC, AAC_PROFILE_HE, AAC_PROFILE_HE_V2};
    }
    for (const int32_t profile : supportedAacProfile) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
    set<int32_t> unsupportedAacProfile = {1, 2, 5};
    for (const int32_t profile : unsupportedAacProfile) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

} // namespace MediaAVCodec
} // namespace OHOS
