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
#include "napi/native_api.h"
#include <js_native_api.h>
#include <cstring>
#include <iostream>
#include <unistd.h>
#include <cstdio>
#include <thread>
#include <native_buffer/native_buffer.h>
#include "hilog/log.h"
#include <fcntl.h>
#include <map>
#include "multimedia/player_framework/native_avscreen_capture.h"
#include "multimedia/player_framework/native_avscreen_capture_base.h"
#include "multimedia/player_framework/native_avscreen_capture_errors.h"

using namespace std;

#define LOG(cond, fmt, ...)           \
    if (!(cond)) {                                  \
        (void)printf(fmt, ##__VA_ARGS__);           \
    }

void SetConfig(OH_AVScreenCaptureConfig &config)
{
    int32_t width = 720;
    int32_t height = 1280;
    OH_AudioCaptureInfo micCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_MIC};
    OH_AudioCaptureInfo innerCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_ALL_PLAYBACK};
    OH_AudioEncInfo audioEncInfo = {.audioBitrate = 48000, .audioCodecformat = OH_AudioCodecFormat::OH_AAC_LC};
    OH_AudioInfo audioInfo = {.micCapInfo = micCapInfo, .innerCapInfo = innerCapInfo, .audioEncInfo = audioEncInfo};

    OH_VideoCaptureInfo videoCapInfo = {
        .videoFrameWidth = width, .videoFrameHeight = height, .videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA};
    OH_VideoEncInfo videoEncInfo = {
        .videoCodec = OH_VideoCodecFormat::OH_H264, .videoBitrate = 2000000, .videoFrameRate = 30};
    OH_VideoInfo videoInfo = {.videoCapInfo = videoCapInfo, .videoEncInfo = videoEncInfo};

    config = {
        .captureMode = OH_CAPTURE_HOME_SCREEN,
        .dataType = OH_ORIGINAL_STREAM,
        .audioInfo = audioInfo,
        .videoInfo = videoInfo,
    };
}

void OnError(OH_AVScreenCapture *capture, int32_t errorCode, void *userData)
{
    (void)capture;
    (void)errorCode;
    (void)userData;
}

void OnStateChange(struct OH_AVScreenCapture *capture, OH_AVScreenCaptureStateCode stateCode, void *userData)
{
    (void)capture;
    (void)stateCode;
    (void)userData;
}

void OnBufferAvailable(OH_AVScreenCapture *capture, OH_AVBuffer *buffer, OH_AVScreenCaptureBufferType bufferType,
                       int64_t timestamp, void *userData)
{
    (void)capture;
    (void)buffer;
    (void)bufferType;
    (void)timestamp;
    (void)userData;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
static napi_value NormalAVScreenCaptureTest(napi_env env, napi_callback_info info)
{
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCapture, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCapture, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCapture, OnBufferAvailable, nullptr);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    int32_t recordTime = 10;
    sleep(recordTime);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_StopScreenCapture(screenCapture);
    int32_t intervalTime = 2;
    sleep(intervalTime);
    OH_AVScreenCapture_Release(screenCapture);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK
        && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        LOG(false, "init/start/stop failed, init: %d, start: %d, stop: %d", result1, result2, result3);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"normalAVScreenCaptureTest", nullptr, NormalAVScreenCaptureTest, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nativeAVScreenCapturendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
