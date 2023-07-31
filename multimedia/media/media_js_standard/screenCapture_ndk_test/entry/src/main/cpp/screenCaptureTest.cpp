/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <native_buffer.h>
#include <unistd.h>
#include <fcntl.h>
#include <securec.h>
#include <cstdio>
#include <string>
#include <map>
#include <iostream>
#include <thread>
#include <inttypes.h>
#include "napi/native_api.h"
#include "native_avscreen_capture.h"
#include "native_avscreen_capture_base.h"
#include "native_avscreen_capture_errors.h"
using namespace std;
static char g_filename[100] = {0};
static int32_t g_recordTime = 3;
static int32_t g_logCount = 30;
static int32_t g_aIndex = 0;
static int32_t g_vIndex = 0;
static int32_t g_aFlag = 0;
static int32_t g_vFlag = 0;

class ScreenCaptureNdkCallBack {
  public:
    virtual ~ScreenCaptureNdkCallBack() = default;
    virtual void OnError(int32_t errorCode) = 0;
    virtual void OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) = 0;
    virtual void OnVideoBufferAvailable(bool isReady) = 0;
};
class ScreenCaptureNdkTestCallback : public ScreenCaptureNdkCallBack {
public:
    ScreenCaptureNdkTestCallback(OH_AVScreenCapture *ScreenCapture, FILE *audioFile, FILE *iFile, FILE *videoFile)
        : screenCapture_(ScreenCapture), aFile(audioFile), innerFile(iFile), vFile(videoFile) {}
    ~ScreenCaptureNdkTestCallback() override;
    void DumpVideoFile(OH_NativeBuffer *nativeBuffer, int32_t length);
    void OnError(int32_t errorCode) override;
    void OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) override;
    void OnVideoBufferAvailable(bool isReady) override;

private:
    OH_AVScreenCapture *screenCapture_;
    FILE *aFile = nullptr;
    FILE *innerFile = nullptr;
    FILE *vFile = nullptr;
};

#define LOG(cond, fmt, ...)           \
    if (!(cond)) {                                  \
        (void)printf(fmt, ##__VA_ARGS__);           \
    }

enum AudioSamplingRate {
    SAMPLE_RATE_8000 = 8000,
    SAMPLE_RATE_11025 = 11025,
    SAMPLE_RATE_12000 = 12000,
    SAMPLE_RATE_16000 = 16000,
    SAMPLE_RATE_22050 = 22050,
    SAMPLE_RATE_24000 = 24000,
    SAMPLE_RATE_32000 = 32000,
    SAMPLE_RATE_44100 = 44100,
    SAMPLE_RATE_48000 = 48000,
    SAMPLE_RATE_64000 = 64000,
    SAMPLE_RATE_96000 = 96000
};

enum AudioChannel {
    MONO = 1,
    STEREO = 2,
    CHANNEL_3 = 3,
    CHANNEL_4 = 4,
    CHANNEL_5 = 5,
    CHANNEL_6 = 6
};

ScreenCaptureNdkTestCallback::~ScreenCaptureNdkTestCallback()
{
    screenCapture_ = nullptr;
    aFile = nullptr;
    innerFile = nullptr;
    vFile = nullptr;
}

void ScreenCaptureNdkTestCallback::OnError(int32_t errorCode)
{
    LOG(false, "Error received, errorCode: %d", errorCode);
}
void ScreenCaptureNdkTestCallback::OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type)
{
    if (isReady == true) {
        OH_AudioBuffer *audioBuffer = (OH_AudioBuffer *)malloc(sizeof(OH_AudioBuffer));
        LOG(audioBuffer != nullptr, "audio buffer is nullptr");
        if (OH_AVScreenCapture_AcquireAudioBuffer(screenCapture_, &audioBuffer, type) == AV_SCREEN_CAPTURE_ERR_OK) {
            LOG(audioBuffer != nullptr, "AcquireAudioBuffer failed, audio buffer empty");
            LOG(g_aIndex % g_logCount != 0,
                "AcquireAudioBuffer, audioBufferLen: %d, timestampe: %" PRId64", audioSourceType: %d",
                audioBuffer->size, audioBuffer->timestamp, audioBuffer->type);
            if ((aFile != nullptr) && (audioBuffer->buf != nullptr) && (type == OH_MIC)) {
                int32_t ret = fwrite(audioBuffer->buf, 1, audioBuffer->size, aFile);
                LOG(ret == audioBuffer->size, "error occurred in fwrite audioFile: %s", strerror(errno));
                free(audioBuffer->buf);
                audioBuffer->buf = nullptr;
            } else if ((innerFile != nullptr) && (audioBuffer->buf != nullptr) && (type == OH_ALL_PLAYBACK)) {
                int32_t ret = fwrite(audioBuffer->buf, 1, audioBuffer->size, innerFile);
                LOG(ret == audioBuffer->size, "error occurred in fwrite innerFile_: %s", strerror(errno));
                free(audioBuffer->buf);
                audioBuffer->buf = nullptr;
            }
            free(audioBuffer);
            audioBuffer = nullptr;
        }
        if (g_aFlag == 1) {
            OH_AVScreenCapture_ReleaseAudioBuffer(screenCapture_, type);
        }
        g_aIndex++;
    } else {
        LOG(false, "AcquireAudioBuffer failed");
    }
}

void ScreenCaptureNdkTestCallback::DumpVideoFile(OH_NativeBuffer *nativeBuffer, int32_t length)
{
    if (vFile != nullptr) {
        void *buf = nullptr;
        OH_NativeBuffer_Map(nativeBuffer, &buf);
        if (buf != nullptr) {
            int32_t ret = fwrite(buf, 1, length, vFile);
            LOG(ret == length, "error occurred in fwrite vFile_: %s", strerror(errno));
        }
    }
}

void ScreenCaptureNdkTestCallback::OnVideoBufferAvailable(bool isReady)
{
    if (isReady == true) {
        int32_t fence = 0;
        int64_t timestamp = 0;
        int32_t size = 4;
        OH_Rect damage;
        OH_NativeBuffer_Config config;
        OH_NativeBuffer *nativeBuffer =
            OH_AVScreenCapture_AcquireVideoBuffer(screenCapture_, &fence, &timestamp, &damage);
        if (nativeBuffer != nullptr) {
            OH_NativeBuffer_GetConfig(nativeBuffer, &config);
            int32_t length = config.height * config.width * size;
            LOG(g_vIndex % g_logCount != 0,
                "AcquireVideoBuffer, videoBufferLen: %d, timestamp: %" PRId64", size: %d", length, timestamp, length);
            DumpVideoFile(nativeBuffer, length);
            OH_NativeBuffer_Unreference(nativeBuffer);
            if (g_vFlag == 1) {
                OH_AVScreenCapture_ReleaseVideoBuffer(screenCapture_);
            }
            g_vIndex++;
        } else {
            LOG(false, "AcquireVideoBuffer failed");
        }
    }
}
std::shared_ptr<ScreenCaptureNdkTestCallback> screenCaptureCb = nullptr;
std::mutex mutex_;
std::map<OH_AVScreenCapture *, std::shared_ptr<ScreenCaptureNdkCallBack>> mockCbMap_;
void DelCallback(OH_AVScreenCapture *screenCapture)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (mockCbMap_.empty()) {
        return;
    }
    auto it = mockCbMap_.find(screenCapture);
    if (it != mockCbMap_.end()) {
        mockCbMap_.erase(it);
    }
}

std::shared_ptr<ScreenCaptureNdkCallBack> GetCallback(OH_AVScreenCapture *screenCapture)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (mockCbMap_.empty()) {
        return nullptr;
    }
    if (mockCbMap_.find(screenCapture) != mockCbMap_.end()) {
        return mockCbMap_.at(screenCapture);
    }
    return nullptr;
}

void OnError(OH_AVScreenCapture *screenCapture, int32_t errorCode)
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnError(errorCode);
    }
}

void OnAudioBufferAvailable(OH_AVScreenCapture *screenCapture, bool isReady,
    OH_AudioCaptureSourceType type)
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnAudioBufferAvailable(isReady, type);
    }
}

void OnVideoBufferAvailable(OH_AVScreenCapture *screenCapture, bool isReady)
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnVideoBufferAvailable(isReady);
    }
}

void SetScreenCaptureCallback(OH_AVScreenCapture *screenCapture, std::shared_ptr<ScreenCaptureNdkTestCallback> &cb)
{
    if (cb != nullptr) {
        std::lock_guard<std::mutex> lock(mutex_);
        mockCbMap_[screenCapture] = cb;
        struct OH_AVScreenCaptureCallback callback;
        callback.onError = OnError;
        callback.onAudioBufferAvailable = OnAudioBufferAvailable;
        callback.onVideoBufferAvailable = OnVideoBufferAvailable;
        OH_AVScreenCapture_SetCallback(screenCapture, callback);
    }
}

OH_AVScreenCapture* CreateScreenCapture()
{
    OH_AVScreenCapture* screenCapture_ = OH_AVScreenCapture_Create();
    return screenCapture_;
}

void SetConfig(OH_AVScreenCaptureConfig &config)
{
    char name[30] = "fd://11";
    int32_t width = 720;
    int32_t height = 1280;
    OH_AudioCaptureInfo miccapinfo = {
        .audioSampleRate = SAMPLE_RATE_16000,
        .audioChannels = STEREO,
        .audioSource = OH_SOURCE_DEFAULT
    };
    OH_VideoCaptureInfo videocapinfo = {
        .videoFrameWidth = width,
        .videoFrameHeight = height,
        .videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA
    };
    OH_AudioInfo audioinfo = {
        .micCapInfo = miccapinfo
    };
    OH_VideoInfo videoinfo = {
        .videoCapInfo = videocapinfo
    };
    OH_RecorderInfo recorderinfo = {
        .url = name
    };
    config = {
        .captureMode = OH_CAPTURE_HOME_SCREEN,
        .dataType = OH_ORIGINAL_STREAM,
        .audioInfo = audioinfo,
        .videoInfo = videoinfo,
        .recorderInfo = recorderinfo
    };
}

FILE* OpenVFile(FILE *videoFile, string filename)
{
    int32_t ret = snprintf_s(g_filename, sizeof(g_filename), sizeof(g_filename) - 1,
        "data/storage/el2/base/files/%s.yuv", filename.c_str());
    if (ret >= 0) {
        videoFile = fopen(g_filename, "w+");
    }
    LOG(videoFile != nullptr, "vFile video open failed, %s", strerror(errno));
    return videoFile;
}

FILE* OpenAFile(FILE *audioFile, string filename)
{
    int32_t ret = snprintf_s(g_filename, sizeof(g_filename), sizeof(g_filename) - 1,
        "data/storage/el2/base/files/%s.pcm", filename.c_str());
    if (ret >= 0) {
        audioFile = fopen(g_filename, "w+");
    }
    LOG(audioFile != nullptr, "aFile audio open failed, %s", strerror(errno));
    return audioFile;
}

void CloseFile(FILE *audioFile, FILE *videoFile)
{
    if (audioFile != nullptr) {
        fclose(audioFile);
        audioFile = nullptr;
    }
    if (videoFile != nullptr) {
        fclose(videoFile);
        videoFile = nullptr;
    }
}

// OH_Media_Screen_Capture_Init_001
static napi_value InitWidthErr(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoFrameWidth = -1;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_002
static napi_value InitHeightErr(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoFrameHeight = -1;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_003
static napi_value InitVideoSourceYUV(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_YUV;

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_004
static napi_value InitVideoSourceES(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_ES;

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Without_AudioData
static napi_value WithoutAudioData(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    FILE *audioFile = nullptr;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_WITHOUT_SOUND_DATA");
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_WITHOUT_SOUND_DATA");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, videoFile);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, videoFile);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_005
static napi_value InitAudioSampleRate_01(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSampleRate = -1;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_006
static napi_value InitAudioSampleRate_02(napi_env env, napi_callback_info info)
{
    int32_t invalidRate = 98000;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSampleRate = invalidRate;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_007
static napi_value InitAudioSampleRate_03(napi_env env, napi_callback_info info)
{
    int32_t invalidRate = 30000;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSampleRate = invalidRate;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_008
static napi_value InitAudioChannels_01(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioChannels = -1;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_009
static napi_value InitAudioChannels_02(napi_env env, napi_callback_info info)
{
    int32_t invalidChannels = 7;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioChannels = invalidChannels;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_010
static napi_value InitAudioSourceErr(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSource = OH_SOURCE_INVALID;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_011
static napi_value ScreenCaptureInitErr(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSource = OH_SOURCE_INVALID;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_YUV;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_With_AudioData
static napi_value WithAudioData(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    FILE *audioFile = nullptr;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_WITH_SOUND_DATA");
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_WITH_SOUND_DATA");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, videoFile);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_012
static napi_value InitCaptureMode_01(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.captureMode = static_cast<OH_CaptureMode>(-1);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_013
static napi_value InitCaptureMode_02(napi_env env, napi_callback_info info)
{
    int32_t invalidMode = 3;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.captureMode = static_cast<OH_CaptureMode>(invalidMode);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_014
static napi_value InitDataType_01(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    config_.dataType = OH_ENCODED_STREAM;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_015
static napi_value InitDataType_02(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    config_.dataType = OH_CAPTURE_FILE;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Init_016
static napi_value InitDataType_03(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    config_.dataType = OH_INVAILD;

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVScreenCapture_Release(screenCapture);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_AudioSampleRate_8000
static napi_value ChangeAudioSampleRate_01(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSampleRate = SAMPLE_RATE_8000;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_AudioSampleRate_96000
static napi_value ChangeAudioSampleRate_02(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSampleRate = SAMPLE_RATE_96000;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_AudioChannels_001
static napi_value ChangeAudioChannels_01(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioChannels = CHANNEL_3;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_AudioChannels_002
static napi_value ChangeAudioChannels_02(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioChannels = CHANNEL_4;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_AudioChannels_003
static napi_value ChangeAudioChannels_03(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioChannels = CHANNEL_5;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_AudioChannels_004
static napi_value ChangeAudioChannels_04(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioChannels = CHANNEL_6;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_VideoSize_001
static napi_value ChangeVideoSize_01(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 160;
    int32_t height = 160;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0001");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_VideoSize_002
static napi_value ChangeVideoSize_02(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 640;
    int32_t height = 480;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0002");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_VideoSize_003
static napi_value ChangeVideoSize_03(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 1920;
    int32_t height = 1080;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEOSIZE_0003");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Display
static napi_value ScreenCaptureFromDisplay(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    size_t argc = 3;
    int32_t num = 2;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    int32_t width;
    napi_get_value_int32(env, args[0], &width);
    int32_t height;
    napi_get_value_int32(env, args[1], &height);
    int32_t frameRate;
    napi_get_value_int32(env, args[num], &frameRate);
    LOG(false, "Get display info: width: %d, height: %d", width, height);
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Buffer_001
static napi_value BufferAndRelease_01(napi_env env, napi_callback_info info)
{
    g_aFlag = 0;
    g_vFlag = 1;
    int32_t time = 15;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(time);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Buffer_002
static napi_value BufferAndRelease_02(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 0;
    int32_t time = 10;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(time);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Buffer_003
static napi_value BufferAndRelease_03(napi_env env, napi_callback_info info)
{
    g_aFlag = 0;
    g_vFlag = 0;
    int32_t time = 10;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(time);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Mic_001
static napi_value SetMicrophoneEnabled_01(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t time = 5;
    FILE *audioFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0001");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(time);
    isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    sleep(g_recordTime);
    isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, nullptr);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Mic_002
static napi_value SetMicrophoneEnabled_02(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t time = 5;
    FILE *audioFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_MICTEST_0002");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, nullptr);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(time);
    isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    sleep(g_recordTime);
    isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, nullptr);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Configure_001
static napi_value ConfigureCombination_01(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 640;
    int32_t height = 480;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.captureMode = OH_CAPTURE_SPECIFIED_SCREEN;
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0001");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT && result2 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT
        && result3 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Configure_002
static napi_value ConfigureCombination_02(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 1920;
    int32_t height = 1080;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.captureMode = OH_CAPTURE_SPECIFIED_SCREEN;
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0002");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT && result2 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT
        && result3 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Configure_003
static napi_value ConfigureCombination_03(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 640;
    int32_t height = 480;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.captureMode = OH_CAPTURE_SPECIFIED_WINDOW;
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0003");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT && result2 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT
        && result3 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_Configure_004
static napi_value ConfigureCombination_04(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 1920;
    int32_t height = 1080;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.captureMode = OH_CAPTURE_SPECIFIED_WINDOW;
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_CONFIG_COMBINATION_0004");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, nullptr, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(nullptr, videoFile);
    screenCaptureCb = nullptr;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT && result2 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT
        && result3 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_MultiInstance
static void *MultiInstance(void *arg)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t width = 1920;
    int32_t height = 1080;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.micCapInfo.audioSampleRate = SAMPLE_RATE_48000;
    config_.videoInfo.videoCapInfo.videoFrameWidth = width;
    config_.videoInfo.videoCapInfo.videoFrameHeight = height;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    FILE *audioFileMulti = nullptr;
    FILE *videoFileMulti = nullptr;
    audioFileMulti = OpenAFile(audioFileMulti, "SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE_2");
    videoFileMulti = OpenVFile(videoFileMulti, "SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE_2");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFileMulti, nullptr,
        videoFileMulti);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFileMulti, videoFileMulti);
    screenCaptureCb = nullptr;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        LOG(false, "MultiInstance init/start/stop success");
    } else {
        LOG(false, "MultiInstance init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
    }
    return arg;
}

static napi_value ScreenCaptureMultiInstance(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    FILE *audioFile = nullptr;
    FILE *videoFile = nullptr;
    pthread_t tid;
    pthread_create(&tid, nullptr, MultiInstance, nullptr);
    struct OH_AVScreenCapture* screenCaptureMulti = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE");
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_MULTI_INSTANCE");
    std::shared_ptr<ScreenCaptureNdkTestCallback> screenCaptureCb_ =
        std::make_shared<ScreenCaptureNdkTestCallback>(screenCaptureMulti, audioFile, nullptr, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureMulti, isMicrophone);
    SetScreenCaptureCallback(screenCaptureMulti, screenCaptureCb_);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureMulti, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureMulti);
    sleep(g_recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCaptureMulti);
    DelCallback(screenCaptureMulti);
    OH_AVScreenCapture_Release(screenCaptureMulti);
    CloseFile(audioFile, videoFile);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    pthread_join(tid, nullptr);
    napi_create_int32(env, result, &res);
    return res;
}

// OH_Media_Screen_Capture_InnerAudio
static napi_value ScreenCaptureInnerAudio(napi_env env, napi_callback_info info)
{
    g_aFlag = 1;
    g_vFlag = 1;
    int32_t time = 5;
    FILE *audioFile = nullptr;
    FILE *videoFile = nullptr;
    OH_AVScreenCapture* screenCapture = CreateScreenCapture();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.audioInfo.innerCapInfo.audioSampleRate = SAMPLE_RATE_48000;
    config_.audioInfo.innerCapInfo.audioChannels = STEREO;
    config_.audioInfo.innerCapInfo.audioSource = OH_ALL_PLAYBACK;
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_INNER_AUDIO(mic)");
    videoFile = OpenVFile(videoFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_INNER_AUDIO(mic)");
    FILE *iFile = fopen("data/storage/el2/base/files/SUB_MULTIMEDIA_SCREEN_CAPTURE_INNER_AUDIO(inner).pcm", "w+");
    LOG(iFile != nullptr, "inner file audio inner open failed, %s", strerror(errno));
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, iFile, videoFile);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    sleep(time);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, videoFile);
    if (iFile != nullptr) {
        fclose(iFile);
        iFile = nullptr;
    }
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK
        && result3 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"initVideoWidthErr", nullptr, InitWidthErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initVideoHeightErr", nullptr, InitHeightErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initVideoSourceErr_YUV", nullptr, InitVideoSourceYUV, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initVideoSourceErr_ES", nullptr, InitVideoSourceES, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"screenCaptureWithoutAudioData", nullptr, WithoutAudioData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAudioSampleErr_01", nullptr, InitAudioSampleRate_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAudioSampleErr_02", nullptr, InitAudioSampleRate_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAudioSampleErr_03", nullptr, InitAudioSampleRate_03, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAudioChannelsErr_01", nullptr, InitAudioChannels_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAudioChannelsErr_02", nullptr, InitAudioChannels_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAudioSourceErr", nullptr, InitAudioSourceErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initAVErr", nullptr, ScreenCaptureInitErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"screenCaptureWithAudioData", nullptr, WithAudioData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initCaptureMode_01", nullptr, InitCaptureMode_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initCaptureMode_02", nullptr, InitCaptureMode_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initDataTypeErr_01", nullptr, InitDataType_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initDataTypeErr_02", nullptr, InitDataType_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initDataTypeErr_03", nullptr, InitDataType_03, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"changeAudioSample_01", nullptr, ChangeAudioSampleRate_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"changeAudioSample_02", nullptr, ChangeAudioSampleRate_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"changeAudioChannels_01", nullptr, ChangeAudioChannels_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"changeAudioChannels_02", nullptr, ChangeAudioChannels_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"changeAudioChannels_03", nullptr, ChangeAudioChannels_03, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"changeAudioChannels_04", nullptr, ChangeAudioChannels_04, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"captureChangeVideoSize_01", nullptr, ChangeVideoSize_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"captureChangeVideoSize_02", nullptr, ChangeVideoSize_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"captureChangeVideoSize_03", nullptr, ChangeVideoSize_03, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"screenCaptureFromDisplay", nullptr, ScreenCaptureFromDisplay, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"setCallbackAcquireBuffer_01", nullptr, BufferAndRelease_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setCallbackAcquireBuffer_02", nullptr, BufferAndRelease_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setCallbackAcquireBuffer_03", nullptr, BufferAndRelease_03, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setMicrophoneOpenCloseOpen", nullptr, SetMicrophoneEnabled_01, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"setMicrophoneCloseOpenClose", nullptr, SetMicrophoneEnabled_02, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"configCombination_01", nullptr, ConfigureCombination_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"configCombination_02", nullptr, ConfigureCombination_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"configCombination_03", nullptr, ConfigureCombination_03, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"configCombination_04", nullptr, ConfigureCombination_04, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"multiInstance", nullptr, ScreenCaptureMultiInstance, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"innerAudioAndMicAudio", nullptr, ScreenCaptureInnerAudio, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
