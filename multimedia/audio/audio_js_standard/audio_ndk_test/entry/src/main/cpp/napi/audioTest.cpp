/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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


#include <string>
#include <cstdio>
#include <cstdint>
#include "napi/native_api.h"
#include "native_audiocapturer.h"
#include "native_audiorenderer.h"
#include "native_audiostream_base.h"
#include "native_audiostreambuilder.h"
#include "unistd.h"
#include "native_audio_manager.h"
#include "native_audio_routing_manager.h"
#include "native_audio_common.h"
#include "native_audio_device_base.h"
#include "native_audio_session_manager.h"

#define DEBUG

#ifdef DEBUG
  #define LOG(fmt, ...) printf(fmt, ##__VA_ARGS__)
#else
 #define LOG(fmt, ...)
#endif


const int32_t SAMPLING_RATE = 48000; // 48000:SAMPLING_RATE value
const int32_t CHANNEL_COUNT = 2; // 2:CHANNEL_COUNT value
const int32_t LATENCY_MODE = 0;
const int32_t SAMPLE_FORMAT = 1;
const int32_t FRAME_SIZE = 240; // 240:FRAME_SIZE value
bool g_flag = false;
bool g_mark = false;
static std::string g_filePath = "/data/storage/el2/base/haps/entry/files/test_44100_2.wav";
FILE *g_file = nullptr;
bool g_readEnd = false;
const int32_t TEST_PASS = 0; // success result
const int32_t TEST_FAIL = 1; // fail result

static int32_t AudioRendererOnMarkReachedWriteData(OH_AudioRenderer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    size_t readCount = fread(buffer, bufferLen, 1, g_file);
    if (!readCount) {
        if (ferror(g_file)) {
            printf("Error reading myfile");
        } else if (feof(g_file)) {
            printf("EOF found");
            g_readEnd = true;
        }
    }
    return 0;
}


static int32_t MyAudioSessionDeactivatedCallback(OH_AudioSession_DeactivatedEvent event)
{
    switch(event.reason) {
        case DEACTIVATED_LOWER_PRIORITY:
        // 应用焦点被抢占
            LOG("MyAudioSessionDeactivatedCallback, event is %d", event.reason);
            return 0;
        case DEACTIVATED_TIMEOUT:
        // 超时
            LOG("MyAudioSessionDeactivatedCallback, event is %d", event.reason);
          return 0;
    }
}

static napi_value CreateAudioStreamBuilder(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
OH_AudioStreamBuilder *CreateCapturerBuilder()
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}


static napi_value AudioCaptureGenerate(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();

    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGenerateErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);

    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureStart(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_Result result = OH_AudioCapturer_Start(audioCapturer);

    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureStartErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Start(audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Start(audioCapturer);

    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCapturePause(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Start(audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Pause(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioCapturePauseErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Pause(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureStop(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Start(audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Stop(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureStopErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Stop(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureFlush(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Start(audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Flush(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioCaptureFlushErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Flush(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureRelease(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Start(audioCapturer);
    OH_AudioStream_Result result = OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureReleaseErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    audioCapturer = nullptr;
    OH_AudioStream_Result result = OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetParameter(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    OH_AudioStream_Result result = OH_AudioCapturer_GetLatencyMode(audioCapturer, &latencyMode);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetCurrentState(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_State state;
    OH_AudioStream_Result result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetStreamId(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    uint32_t streamId;
    OH_AudioStream_Result result = OH_AudioCapturer_GetStreamId(audioCapturer, &streamId);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetSamplingRate(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    int32_t rate;
    OH_AudioStream_Result result = OH_AudioCapturer_GetSamplingRate(audioCapturer, &rate);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetSampleFormat(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_SampleFormat sampleFormat;
    OH_AudioStream_Result result = OH_AudioCapturer_GetSampleFormat(audioCapturer, &sampleFormat);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetEncodingType(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_EncodingType encodingType;
    OH_AudioStream_Result result = OH_AudioCapturer_GetEncodingType(audioCapturer, &encodingType);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetCapturerInfo(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_SourceType sourceType;
    OH_AudioStream_Result result = OH_AudioCapturer_GetCapturerInfo(audioCapturer, &sourceType);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetTimestamp(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioCapturer_Start(audioCapturer);

    usleep(30000);
    int64_t  framePosition;
    int64_t  timestamp;
    OH_AudioStream_Result result = OH_AudioCapturer_GetTimestamp(audioCapturer, CLOCK_MONOTONIC, &framePosition, &timestamp);
    OH_AudioCapturer_Stop(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetFramesRead(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    int64_t  frames;
    OH_AudioStream_Result result = OH_AudioCapturer_GetFramesRead(audioCapturer, &frames);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetFrameSizeInCallback(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    int32_t  frameSize;
    OH_AudioStream_Result result = OH_AudioCapturer_GetFrameSizeInCallback(audioCapturer, &frameSize);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


OH_AudioStreamBuilder *CreateRenderBuilder()
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

static napi_value AudioRendererSetSpeed(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float speed = 2;
    OH_AudioStream_Result result = OH_AudioRenderer_SetSpeed(audioRenderer,speed);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRendererGetSpeed(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float speed;
    OH_AudioStream_Result result = OH_AudioRenderer_GetSpeed(audioRenderer,&speed);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRendererSetGetSpeed(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float setSpeed = 1.5;
    OH_AudioRenderer_SetSpeed(audioRenderer,setSpeed);
    float getSpeed;
    OH_AudioRenderer_GetSpeed(audioRenderer,&getSpeed);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_double(env, getSpeed, &res);
    return res;
}

static void AudioRendererDeviceChangeCb(OH_AudioRenderer* renderer, void* userData,
    OH_AudioStream_DeviceChangeReason reason)
{}

static napi_value AudioSetRendererOutputDeviceChangeCallback(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);

    OH_AudioRenderer_OutputDeviceChangeCallback deviceChangeCb = AudioRendererDeviceChangeCb;
    
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, deviceChangeCb, NULL);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetFramesWritten(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    int64_t frames;
    OH_AudioStream_Result result = OH_AudioRenderer_GetFramesWritten(audioRenderer, &frames);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetTimestamp(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);

    usleep(30000);
    int64_t framePosition;
    int64_t  timestamp;
    OH_AudioStream_Result result = OH_AudioRenderer_GetTimestamp(audioRenderer, CLOCK_MONOTONIC, &framePosition, &timestamp);
    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetFrameSizeInCallback(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    int32_t  frameSize;
    OH_AudioStream_Result result = OH_AudioRenderer_GetFrameSizeInCallback(audioRenderer, &frameSize);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGenerate(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGenerateErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);

    OH_AudioRenderer *audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderStart(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Start(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderStartErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Start(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderPause(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Pause(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderPauseErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Pause(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderStop(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderStopErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderFlush(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Flush(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderFlushErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Flush(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderRelease(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioStream_Result result = OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderReleaseErr(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    audioRenderer = nullptr;
    OH_AudioStream_Result result = OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetCurrentState(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_State state;
    OH_AudioStream_Result result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderGetParameter(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    OH_AudioStream_Result result = OH_AudioRenderer_GetLatencyMode(audioRenderer, &latencyMode);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderGetStreamId(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    uint32_t streamId;
    OH_AudioStream_Result result = OH_AudioRenderer_GetStreamId(audioRenderer, &streamId);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetSamplingRate(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    int32_t rate;
    OH_AudioStream_Result result = OH_AudioRenderer_GetSamplingRate(audioRenderer, &rate);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderGetSampleFormat(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_SampleFormat sampleFormat;
    OH_AudioStream_Result result = OH_AudioRenderer_GetSampleFormat(audioRenderer, &sampleFormat);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioRenderGetEncodingType(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_EncodingType encodingType;
    OH_AudioStream_Result result = OH_AudioRenderer_GetEncodingType(audioRenderer, &encodingType);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetRendererInfo(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_Usage usage;
    OH_AudioStream_Result result = OH_AudioRenderer_GetRendererInfo(audioRenderer, &usage);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioStreamBuilderSetSamplingRate(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t samplingRate = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioStreamBuilderSetChannelCount(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t channelCount = 1;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioStreamBuilderSetSampleFormat(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_U8;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioStreamBuilderSetEncodingType(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_RAW;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioStreamBuilderSetLatencyMode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);

    OH_AudioStream_Result result = OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioStreamBuilderSetRendererInfo(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value AudioStreamBuilderSetCapturerInfo(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_MIC;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return 0;
}
static napi_value AudioStreamBuilderSetRendererCallback(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, NULL);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static int32_t AudioCapturerOnReadData(
    OH_AudioCapturer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return 0;
}
static napi_value AudioStreamBuilderSetCapturerCallback(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);

    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, NULL);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioCaptureGetChannelCount(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    int32_t channelCount;
    OH_AudioStream_Result result = OH_AudioCapturer_GetChannelCount(audioCapturer, &channelCount);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRenderGetChannelCount(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    int32_t channelCount;
    OH_AudioStream_Result result = OH_AudioRenderer_GetChannelCount(audioRenderer, &channelCount);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioStreamBuilderSetFrameSizeInCallback(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t framesize = 960;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, framesize);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioRendererGetVolume_01(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volume;
    OH_AudioStream_Result result = OH_AudioRenderer_GetVolume(audioRenderer, &volume);
    LOG("OH_AudioRenderer_GetVolume, volumeGet is %f, result %d", volume, result);
    napi_value res;
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRendererSetVolume_01(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 1.0, result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    LOG("OH_AudioRenderer_GetVolume, volumeGet is %f, %d", volumeGet, result);
    if (result != AUDIOSTREAM_SUCCESS || volumeGet != volumeSet) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolume_02(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.0, result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    LOG("OH_AudioRenderer_GetVolume, volumeGet is %f, %d", volumeGet, result);
    if (result != AUDIOSTREAM_SUCCESS || volumeGet != volumeSet) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolume_03(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 0.3; // 0.3:value of volumeSet
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.3, result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    volumeSet = 0.8; // 0.8:value of volumeSet
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.8, result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    LOG("OH_AudioRenderer_GetVolume, volumeGet is %f, %d", volumeGet, result);
    if (result != AUDIOSTREAM_SUCCESS || volumeGet != volumeSet) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolume_04(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = -1.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume -1.0 result is %d", result);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolume_05(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 1.5; // 1.5:value of volumeSet
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 1.5 result is %d", result);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolume_06(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volumeSet = 0.5; // 0.5:value of volumeSet
    napi_value res;
    OH_AudioStream_Result result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    LOG("OH_AudioRenderer_GetVolume, volumeGet is %f, %d", volumeSet, result);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_01(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 1000; // 1000:value of durationMs
    volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 0.0->1.0 1000 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_02(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 1.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 100; // 100:value of durationMs
    volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 1.0->0.0 100 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_03(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 10; // 10:value of durationMs
    volumeSet = 0.5; // 0.5:value of volumeSet
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 0.0->0.5 10 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_04(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 1.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 10; // 10:value of durationMs
    volumeSet = 0.5; // 0.5:value of volumeSet
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 1.0->0.5 10 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_05(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 10; // 10:value of durationMs
    volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 0.0->0.0 10 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_06(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 1.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 10; // 10:value of durationMs
    volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 1.0->1.0 10 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_07(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 1.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 1.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 100; // 100:value of durationMs
    volumeSet = 1.2; // 1.2:value of volumeSet
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 1.0->1.2 100 result is %d", result);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_08(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    float volumeSet = 0.0;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    LOG("OH_AudioRenderer_SetVolume 0.0 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t durationMs = 100; // 100:value of durationMs
    volumeSet = -0.2; // -0.2:invalid value of volumeSet
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    LOG("OH_AudioRenderer_SetVolumeWithRamp 0.0->-0.2 100 result is %d", result);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetVolumeWithRamp_09(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volumeSet = 0.5; // 0.5:value of volumeSet
    int32_t durationMs = 10; // 10:value of durationMs
    OH_AudioStream_Result result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    napi_value res;
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static void AudioRendererOnMarkReachedCb(OH_AudioRenderer* renderer, uint32_t samplePos, void* userData)
{
    g_flag = true;
    printf("AudioRendererOnMarkReachedCb samplePos: %d \n", samplePos);
}

static napi_value AudioRendererSetOnMarkReached_01(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_01 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetOnMarkReached_02(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    uint32_t samplePos = 0;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_02 result is: %d", result);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetOnMarkReached_03(napi_env env, napi_callback_info info)
{
    g_flag = false;
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    napi_value res;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_MODE);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    // set buffer size to FRAME_SIZE
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_03 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 2;
    OH_AudioRenderer_Start(audioRenderer);
    sleep(waitTime); // 2:sleep 2 seconds
    OH_AudioRenderer_Stop(audioRenderer);
    if (!g_flag) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetOnMarkReached_04(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    OH_AudioStream_Result result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    napi_value res;
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRendererSetOnMarkReached_05(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    napi_value res;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 4294967295; // 4294967295:uint32_t 2^32 - 1
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    OH_AudioStream_Result result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_05 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetOnMarkReached_06(napi_env env, napi_callback_info info)
{
    g_flag = false;
    g_file = fopen(g_filePath.c_str(), "rb");
    if (g_file == nullptr) {
        LOG("fopen fail. g_file: %p\n", g_file);
    }
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    napi_value res;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_MODE);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnMarkReachedWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    // set buffer size to FRAME_SIZE
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 10538568; // 10538568:Test_44100_2.wav The total number of frames in the audio file
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_06 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 220;
    OH_AudioRenderer_Start(audioRenderer);
    sleep(waitTime); // 220:Play the entire music
    OH_AudioRenderer_Stop(audioRenderer);
    if (!g_flag) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetOnMarkReached_07(napi_env env, napi_callback_info info)
{
    g_flag = false;
    g_file = fopen(g_filePath.c_str(), "rb");
    if (g_file == nullptr) {
        LOG("fopen fail. g_file: %p\n", g_file);
    }
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    napi_value res;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_MODE);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnMarkReachedWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    // set buffer size to FRAME_SIZE
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 10538570; // 10538570:Test_44100_2.wav The total number of frames in the audio file + 2
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_07 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 10;
    OH_AudioRenderer_Start(audioRenderer);
    sleep(waitTime); // 10:Play for 10 seconds
    OH_AudioRenderer_Stop(audioRenderer);
    if (!g_flag) {
        napi_create_int32(env, TEST_PASS, &res);
    } else {
        napi_create_int32(env, TEST_FAIL, &res);
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetOnMarkReached_08(napi_env env, napi_callback_info info)
{
    g_flag = false;
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    napi_value res;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_MODE);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    // set buffer size to FRAME_SIZE
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_AudioRenderer_SetMarkPosition result1 is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_AudioRenderer_SetMarkPosition result2 is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_08 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 2;
    OH_AudioRenderer_Start(audioRenderer);
    sleep(waitTime);
    OH_AudioRenderer_Stop(audioRenderer);
    if (!g_flag) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererCancelMark_01(napi_env env, napi_callback_info info)
{
    g_flag = false;
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    napi_value res;
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_MODE);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    // set buffer size to FRAME_SIZE
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    LOG("OH_Audio_Renderer_SetOnMarkReached_03 result is: %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 2;
    sleep(waitTime); // 2:sleep 2 seconds
    // CancelMark
    result = OH_AudioRenderer_CancelMark(audioRenderer);
    LOG("OH_AudioRenderer_CancelMark result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioRenderer_Stop(audioRenderer);
    if (!g_flag) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererCancelMark_02(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    napi_value res;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    result = OH_AudioRenderer_CancelMark(audioRenderer);
    LOG("OH_AudioRenderer_CancelMark result is %d", result);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRendererCancelMark_03(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    OH_AudioStream_Result result = OH_AudioRenderer_CancelMark(audioRenderer);
    napi_value res;
    LOG("OH_AudioRenderer_CancelMark result is %d", result);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static int32_t AudioRendererInterruptEvent(OH_AudioRenderer* renderer,
    void* userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    g_mark = true;
    printf("AudioRendererInterruptEvent type = %d, hint = %d\n", type, hint);
    return 0;
}

static napi_value AudioRendererSetInterruptMode_01(napi_env env, napi_callback_info info)
{
    g_mark = false;
    napi_value res;
    // 1. create builder
    OH_AudioStreamBuilder* builder1;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder1, type);

    OH_AudioStreamBuilder* builder2;
    OH_AudioStreamBuilder_Create(&builder2, type);

    // 2. set builder1 builder2 params
    OH_AudioStreamBuilder_SetRendererInfo(builder1, usage);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder1, callbacks, nullptr);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder1, FRAME_SIZE);

    usage = AUDIOSTREAM_USAGE_MOVIE;
    OH_AudioStreamBuilder_SetRendererInfo(builder2, usage);
    OH_AudioStreamBuilder_SetRendererCallback(builder2, callbacks, nullptr);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder2, FRAME_SIZE);

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    LOG("OH_AudioStreamBuilder_SetRendererInterruptMode builder1 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder2, mode);
    LOG("OH_AudioStreamBuilder_SetRendererInterruptMode builder2 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 3. create audioRenderer1 audioRenderer2
    OH_AudioRenderer* audioRenderer1;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    OH_AudioRenderer* audioRenderer2;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder2, &audioRenderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 1;
    sleep(waitTime);
    result = OH_AudioRenderer_Start(audioRenderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }

    // 5. stop and release client
    OH_AudioRenderer_Stop(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer2);
    OH_AudioRenderer_Stop(audioRenderer1);
    OH_AudioRenderer_Release(audioRenderer1);
    OH_AudioStreamBuilder_Destroy(builder2);
    OH_AudioStreamBuilder_Destroy(builder1);
    return res;
}

static napi_value AudioRendererSetInterruptMode_02(napi_env env, napi_callback_info info)
{
    g_mark = false;
    napi_value res;
    // 1. create builder
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    OH_AudioStreamBuilder* builder2;
    OH_AudioStreamBuilder_Create(&builder2, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    usage = AUDIOSTREAM_USAGE_MOVIE;
    OH_AudioStreamBuilder_SetRendererInfo(builder2, usage);
    OH_AudioStreamBuilder_SetRendererCallback(builder2, callbacks, nullptr);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder2, FRAME_SIZE);

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    LOG("OH_AudioStreamBuilder_SetRendererInterruptMode builder1 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder2, mode);
    LOG("OH_AudioStreamBuilder_SetRendererInterruptMode builder2 result is %d", result);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 3. create audioRenderer1 audioRenderer2
    OH_AudioRenderer* audioRenderer1;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioRenderer* audioRenderer2;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder2, &audioRenderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    const int waitTime = 2;
    sleep(waitTime);
    result = OH_AudioRenderer_Start(audioRenderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    sleep(waitTime); // 2:sleep 2 seconds

    if (!g_mark) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }

    // 5. stop and release client
    OH_AudioRenderer_Stop(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer2);
    OH_AudioRenderer_Stop(audioRenderer1);
    OH_AudioRenderer_Release(audioRenderer1);
    OH_AudioStreamBuilder_Destroy(builder);
    OH_AudioStreamBuilder_Destroy(builder2);
    return res;
}

static napi_value AudioRendererSetInterruptMode_03(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    LOG("OH_AudioRenderer_SetInterruptMode_03, result is: %d", result);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRendererSetInterruptMode_04(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioInterrupt_Mode mode = static_cast<OH_AudioInterrupt_Mode>(-2);
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    LOG("OH_AudioRenderer_SetInterruptMode_04, result is: %d", result);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static int32_t DeviceChangeCallback(OH_AudioDevice_ChangeType type,
    OH_AudioDeviceDescriptorArray *audioDeviceDescriptorArray)
{
    printf("DeviceChangeCallback triggrred, ChangeType: %d\n", type);
    if (type == AUDIO_DEVICE_CHANGE_TYPE_CONNECT) {
        int size = audioDeviceDescriptorArray->size;
        for (int index = 0; index < size; index++) {
            OH_AudioDeviceDescriptor *audioDeviceDescriptor = audioDeviceDescriptorArray->descriptors[index];
            if (audioDeviceDescriptor) {
                OH_AudioDevice_Role deviceRole = AUDIO_DEVICE_ROLE_OUTPUT;
                OH_AudioDeviceDescriptor_GetDeviceRole(audioDeviceDescriptor, &deviceRole);
                OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_INVALID;
                OH_AudioDeviceDescriptor_GetDeviceType(audioDeviceDescriptor, &deviceType);
                printf("Receive new device: DeviceRole: %d, DeviceType: %d\n", deviceRole, deviceType);
            }
        }
    }
    return 0;
}

static napi_value AudioManagerGetAudioRoutingManager_01(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    LOG("AudioManagerGetAudioRoutingManager_01, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerGetDevices_01(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_NONE;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_01, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_NO_MEMORY || array != nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerGetDevices_02(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_02, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioRoutingManagerGetDevices_03(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_INPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_03, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioRoutingManagerGetDevices_04(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_04, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioRoutingManagerGetDevices_05(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t flag = -1;
    OH_AudioDevice_Flag deviceFlag = (OH_AudioDevice_Flag)flag;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_05, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM || array != nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerGetDevices_06(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioCommon_Result result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_06, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM || array != nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerGetDevices_07(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t flag = 4;
    OH_AudioDevice_Flag deviceFlag = (OH_AudioDevice_Flag)flag;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    LOG("AudioRoutingManagerGetDevices_07, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM || array != nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioManagerGetManager_01(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioManager **audioManager = nullptr;
    OH_AudioCommon_Result result = OH_GetAudioManager(audioManager);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioManagerGetManager_02(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioManager *audioManager = nullptr;
    OH_AudioCommon_Result result = OH_GetAudioManager(&audioManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioManagerGetAudioScene_01(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioManager *audioManager = nullptr;
    OH_AudioCommon_Result result = OH_GetAudioManager(&audioManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioScene scene = AUDIO_SCENE_DEFAULT;
    result = OH_GetAudioScene(audioManager, &scene);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioManagerGetAudioScene_02(napi_env env, napi_callback_info info)
{
    napi_value res;

    OH_AudioScene scene = AUDIO_SCENE_DEFAULT;
    OH_AudioCommon_Result result = OH_GetAudioScene(nullptr, &scene);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_GetAudioScene(nullptr, nullptr);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    OH_AudioManager *audioManager = nullptr;
    result = OH_GetAudioManager(&audioManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_GetAudioScene(audioManager, nullptr);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioRoutingManagerGetAvailableDevices001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Usage deviceUsage = AUDIO_DEVICE_USAGE_MEDIA_OUTPUT;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, deviceUsage, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioRoutingManagerGetPreferredOutputDevice001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioStream_Usage streamUsage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetPreferredOutputDevice(audioRoutingManager, streamUsage, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioRoutingManagerGetPreferredInputDevice001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_MIC;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetPreferredInputDevice(audioRoutingManager, sourceType, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_NONE;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_001, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_INPUT;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_004, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_005, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = nullptr;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_006, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t flag = -1;
    OH_AudioDevice_Flag deviceFlag = (OH_AudioDevice_Flag)flag;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_007, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerRegisterDeviceChangeCallback_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int32_t flag = 4;
    OH_AudioDevice_Flag deviceFlag = (OH_AudioDevice_Flag)flag;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    LOG("AudioRoutingManagerRegisterDeviceChangeCallback_008, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerUnregisterDeviceChangeCallback_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    result = OH_AudioRoutingManager_UnregisterDeviceChangeCallback(audioRoutingManager, callback);
    LOG("AudioRoutingManagerUnregisterDeviceChangeCallback_001, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerUnregisterDeviceChangeCallback_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    OH_AudioCommon_Result result = OH_AudioRoutingManager_UnregisterDeviceChangeCallback(
        audioRoutingManager, callback);
    LOG("AudioRoutingManagerUnregisterDeviceChangeCallback_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerUnregisterDeviceChangeCallback_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = nullptr;
    result = OH_AudioRoutingManager_UnregisterDeviceChangeCallback(audioRoutingManager, callback);
    LOG("AudioRoutingManagerUnregisterDeviceChangeCallback_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerReleaseDevices_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioDeviceDescriptorArray *audioDeviceDescriptorArray = nullptr;
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, audioDeviceDescriptorArray);
    LOG("AudioRoutingManagerReleaseDevices_001, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioRoutingManagerReleaseDevices_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDeviceDescriptorArray *audioDeviceDescriptorArray = nullptr;
    result = OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, audioDeviceDescriptorArray);
    LOG("AudioRoutingManagerReleaseDevices_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_INVALID;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
        LOG("AudioAudioDeviceDescriptorGetDeviceType_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || descriptor == nullptr || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceType_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceType_003(napi_env env, napi_callback_info info)
{
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_INVALID;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    LOG("AudioAudioDeviceDescriptorGetDeviceType_003, result is: %d", result);
    napi_value res;
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceRole_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        OH_AudioDevice_Role deviceRole = AUDIO_DEVICE_ROLE_OUTPUT;
        result = OH_AudioDeviceDescriptor_GetDeviceRole(descriptor, &deviceRole);
        LOG("AudioAudioDeviceDescriptorGetDeviceRole_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceRole_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioDeviceDescriptor_GetDeviceRole(descriptor, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceRole_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceRole_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    OH_AudioDevice_Role deviceRole = AUDIO_DEVICE_ROLE_OUTPUT;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceRole(descriptor, &deviceRole);
    LOG("AudioAudioDeviceDescriptorGetDeviceRole_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceId_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
    if (descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    uint32_t id = 0;
    result = OH_AudioDeviceDescriptor_GetDeviceId(descriptor, &id);
    LOG("AudioAudioDeviceDescriptorGetDeviceId_001, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceId_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioDeviceDescriptor_GetDeviceId(descriptor, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceId_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceId_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    uint32_t id = 0;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceId(descriptor, &id);
    LOG("AudioAudioDeviceDescriptorGetDeviceId_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceName_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        char* deviceName;
        result = OH_AudioDeviceDescriptor_GetDeviceName(descriptor, &deviceName);
        LOG("AudioAudioDeviceDescriptorGetDeviceName_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceName_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioDeviceDescriptor_GetDeviceName(descriptor, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceName_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceName_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    char* deviceName;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceName(descriptor, &deviceName);
    LOG("AudioAudioDeviceDescriptorGetDeviceName_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceAddress_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        char *address;
        result = OH_AudioDeviceDescriptor_GetDeviceAddress(descriptor, &address);
        LOG("AudioAudioDeviceDescriptorGetDeviceAddress_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceAddress_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioDeviceDescriptor_GetDeviceAddress(descriptor, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceAddress_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceAddress_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    char *address;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceAddress(descriptor, &address);
    LOG("AudioAudioDeviceDescriptorGetDeviceAddress_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceSampleRates_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        uint32_t *sampleRates;
        uint32_t size = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceSampleRates(descriptor, &sampleRates, &size);
        LOG("AudioAudioDeviceDescriptorGetDeviceSampleRates_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceSampleRates_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    uint32_t size = 0;
    result = OH_AudioDeviceDescriptor_GetDeviceSampleRates(descriptor, nullptr, &size);
    LOG("AudioAudioDeviceDescriptorGetDeviceSampleRates_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceSampleRates_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    uint32_t *sampleRates;
    result = OH_AudioDeviceDescriptor_GetDeviceSampleRates(descriptor, &sampleRates, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceSampleRates_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceSampleRates_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    uint32_t *sampleRates;
    uint32_t size = 0;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceSampleRates(descriptor, &sampleRates, &size);
    LOG("AudioAudioDeviceDescriptorGetDeviceSampleRates_004, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceChannelCounts_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        uint32_t *channelCounts;
        uint32_t channelSize = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceChannelCounts(descriptor, &channelCounts, &channelSize);
        LOG("AudioAudioDeviceDescriptorGetDeviceChannelCounts_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceChannelCounts_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    uint32_t channelSize = 0;
    result = OH_AudioDeviceDescriptor_GetDeviceChannelCounts(descriptor, nullptr, &channelSize);
    LOG("AudioAudioDeviceDescriptorGetDeviceChannelCounts_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceChannelCounts_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    uint32_t *channelCounts;
    result = OH_AudioDeviceDescriptor_GetDeviceChannelCounts(descriptor, &channelCounts, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceChannelCounts_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceChannelCounts_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    uint32_t *channelCounts;
    uint32_t channelSize = 0;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceChannelCounts(
        descriptor, &channelCounts, &channelSize);
    LOG("AudioAudioDeviceDescriptorGetDeviceChannelCounts_004, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceDisplayName_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        char *displayName;
        result = OH_AudioDeviceDescriptor_GetDeviceDisplayName(descriptor, &displayName);
        LOG("AudioAudioDeviceDescriptorGetDeviceDisplayName_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceDisplayName_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    result = OH_AudioDeviceDescriptor_GetDeviceDisplayName(descriptor, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceDisplayName_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceDisplayName_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    char *displayName;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceDisplayName(descriptor, &displayName);
    LOG("AudioAudioDeviceDescriptorGetDeviceDisplayName_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceEncodingTypes_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        if (descriptor == nullptr) {
            napi_create_int32(env, TEST_FAIL, &res);
            return res;
        }
        OH_AudioStream_EncodingType *encodingTypes;
        uint32_t encodingTypeSize = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceEncodingTypes(descriptor, &encodingTypes, &encodingTypeSize);
        LOG("AudioAudioDeviceDescriptorGetDeviceEncodingTypes_001, result is: %d", result);
        if (result != AUDIOCOMMON_RESULT_SUCCESS) {
            napi_create_int32(env, TEST_FAIL, &res);
            break;
        } else {
            napi_create_int32(env, TEST_PASS, &res);
        }
    }
    OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceEncodingTypes_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    uint32_t encodingTypeSize = 0;
    result = OH_AudioDeviceDescriptor_GetDeviceEncodingTypes(descriptor, nullptr, &encodingTypeSize);
    LOG("AudioAudioDeviceDescriptorGetDeviceEncodingTypes_002, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceEncodingTypes_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioCommon_Result result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result != AUDIOCOMMON_RESULT_SUCCESS || audioRoutingManager == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_OUTPUT;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioDeviceDescriptor *descriptor = array->descriptors[0];
    if (result != AUDIOCOMMON_RESULT_SUCCESS || array == nullptr || descriptor == nullptr) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    OH_AudioStream_EncodingType *encodingTypes;
    result = OH_AudioDeviceDescriptor_GetDeviceEncodingTypes(descriptor, &encodingTypes, nullptr);
    LOG("AudioAudioDeviceDescriptorGetDeviceEncodingTypes_003, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioDeviceDescriptorGetDeviceEncodingTypes_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioDeviceDescriptor *descriptor = nullptr;
    OH_AudioStream_EncodingType *encodingTypes;
    uint32_t encodingTypeSize = 0;
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceEncodingTypes(
        descriptor, &encodingTypes, &encodingTypeSize);
    LOG("AudioAudioDeviceDescriptorGetDeviceEncodingTypes_004, result is: %d", result);
    if (result != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }
    return res;
}

static napi_value AudioAudioInternalRecordingSuccess01(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_PrivacyType type = AUDIO_STREAM_PRIVACY_TYPE_PUBLIC;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, type);
    
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioAudioInternalRecordingSuccess02(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioStream_PrivacyType type = AUDIO_STREAM_PRIVACY_TYPE_PRIVATE;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, type);
    OH_AudioRenderer *audioRenderer = nullptr;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_PrivacyType type_get;
    OH_AudioStream_Result result1 = OH_AudioRenderer_GetRendererPrivacy(audioRenderer, &type_get);
    if (result == AUDIOSTREAM_SUCCESS && result1 == AUDIOSTREAM_SUCCESS
        && type_get == AUDIO_STREAM_PRIVACY_TYPE_PRIVATE) {
        result = AUDIOSTREAM_SUCCESS;
    } else {
        result = AUDIOSTREAM_ERROR_INVALID_PARAM;
    };
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioAudioInternalRecordingFalse(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_PrivacyType type = static_cast<OH_AudioStream_PrivacyType>(2);
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, type);
    
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static OH_AudioData_Callback_Result WriteDataCallbackWithValidResult(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result WriteDataCallbackWithInvalidResult(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

static napi_value AudioStreamBuilderSetRendererWriteDataCallback_001(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer_OnWriteDataCallback onWriteDataCallback = WriteDataCallbackWithValidResult;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder,
        onWriteDataCallback, nullptr);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioStreamBuilderSetRendererWriteDataCallback_002(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer_OnWriteDataCallback onWriteDataCallback = WriteDataCallbackWithInvalidResult;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder,
        onWriteDataCallback, nullptr);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value audioCapturerGetOverflowCount_001(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder* builder = CreateCapturerBuilder();
    int32_t samplingRate = 48000;
    OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    int32_t channelCount = 2;
    OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);

    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, NULL);

    OH_AudioCapturer* audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    result = OH_AudioCapturer_Start(audioCapturer);

    uint32_t overFlowCount;
    result = OH_AudioCapturer_GetOverflowCount(audioCapturer, &overFlowCount);

    OH_AudioCapturer_Stop(audioCapturer);
    OH_AudioCapturer_Release(audioCapturer);

    OH_AudioStreamBuilder_Destroy(builder);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value AudioSessionManagerStrategy_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };
    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 等待1秒
    sleep(1);

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerStrategy_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_DEFAULT
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }
    // sleep 1 seconds
    sleep(1);

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerStrategy_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_DUCK_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }
    // sleep 1 seconds
    sleep(1);

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerStrategy_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_PAUSE_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }
    // sleep 1 seconds
    sleep(1);

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerStrategyError_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(nullptr, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerActivatedError_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(nullptr);
    if (isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerStopError_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(nullptr);
    if (resultDeactivate != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerStopError_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }
    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate1 = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate1 != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate1, result is: %d", TEST_FAIL);
        return res;
    }
    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate2 = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate2 != AUDIOCOMMON_RESULT_ERROR_ILLEGAL_STATE) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate2, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerRegisterError_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(nullptr, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerRegisterError_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(audioSessionManager, nullptr);
    if (resultRegister != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerUnregisterError_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate =
        OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(nullptr, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 取消监听音频会话停用事件
    resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerUnregisterError_002(napi_env env, napi_callback_info info) 
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate =
        OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(audioSessionManager, nullptr);
    if (resultUnregister != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 取消监听音频会话停用事件
    resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerReason_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // create builder
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    OH_AudioRenderer* audioRenderer1;
    OH_AudioStream_Result createResult = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer1);
    if (createResult != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // create audioRenderer1 audioRenderer2
    OH_AudioStreamBuilder* builder2;
    OH_AudioStreamBuilder_Create(&builder2, type);
    OH_AudioStreamBuilder_SetRendererInfo(builder2, usage);
    OH_AudioRenderer* audioRenderer2;
    createResult = OH_AudioStreamBuilder_GenerateRenderer(builder2, &audioRenderer2);
    if (createResult != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }

    // start
    createResult = OH_AudioRenderer_Start(audioRenderer1);
    if (createResult != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    //sleep 1 seconds
    sleep(1);
    createResult = OH_AudioRenderer_Start(audioRenderer2);
    if (createResult != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    //sleep 1 seconds
    sleep(1);

    // stop and release client
    OH_AudioRenderer_Release(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer1);
    OH_AudioStreamBuilder_Destroy(builder);
    OH_AudioStreamBuilder_Destroy(builder2);
    sleep(1);

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    // 停用音频会话
    OH_AudioCommon_Result resultDeactivate = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (resultDeactivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultDeactivate, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}


static napi_value AudioSessionManagerReason_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSessionManager* audioSessionManager;
    OH_AudioCommon_Result resultManager = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (resultManager != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultManager, result is: %d", TEST_FAIL);
        return res;
    }
    OH_AudioSession_Strategy strategy = {
        CONCURRENCY_MIX_WITH_OTHERS
    };

    // 设置音频并发模式并激活音频会话
    OH_AudioCommon_Result resultActivate = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (resultActivate != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultActivate, result is: %d", TEST_FAIL);
        return res;
    }

    // 查询音频会话是否已激活。
    bool isActivated = OH_AudioSessionManager_IsAudioSessionActivated(audioSessionManager);
    if (!isActivated) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("isActivated, result is: %d", TEST_FAIL);
        return res;
    }

    // create builder
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder* builder;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    OH_AudioRenderer* audioRenderer1;
    OH_AudioStream_Result createResult = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer1);
    if (createResult != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 监听音频会话停用事件
    OH_AudioCommon_Result resultRegister =
        OH_AudioSessionManager_RegisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultRegister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultRegister, result is: %d", TEST_FAIL);
        return res;
    }

    // start
    createResult = OH_AudioRenderer_Start(audioRenderer1);
    if (createResult != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }
    sleep(1);
    OH_AudioRenderer_Stop(audioRenderer1);
    //sleep 65 seconds 创造超时条件
    sleep(65);

    // release client
    OH_AudioRenderer_Release(audioRenderer1);
    OH_AudioStreamBuilder_Destroy(builder);

    // 取消监听音频会话停用事件
    OH_AudioCommon_Result resultUnregister =
        OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(
            audioSessionManager, MyAudioSessionDeactivatedCallback);
    if (resultUnregister != AUDIOCOMMON_RESULT_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        LOG("resultUnregister, result is: %d", TEST_FAIL);
        return res;
    }

    napi_create_int32(env, TEST_PASS, &res);
    return res;
}

static napi_value AudioRendererSetDefaultOutputDevice_01(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_WIRED_HEADSET;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 5. OH_AudioRenderer_SetDefaultOutputDevice
    result = OH_AudioRenderer_SetDefaultOutputDevice(audioRenderer, deviceType);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetDefaultOutputDevice_02(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 5. OH_AudioRenderer_SetDefaultOutputDevice
    result = OH_AudioRenderer_SetDefaultOutputDevice(audioRenderer, deviceType);
    if (result != AUDIOSTREAM_ERROR_ILLEGAL_STATE) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

static napi_value AudioRendererSetDefaultOutputDevice_03(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, TEST_FAIL, &res);
        return res;
    }

    // 5. OH_AudioRenderer_SetDefaultOutputDevice
    result = OH_AudioRenderer_SetDefaultOutputDevice(nullptr, deviceType);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, TEST_FAIL, &res);
    } else {
        napi_create_int32(env, TEST_PASS, &res);
    }

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"createAudioStreamBuilder", nullptr, CreateAudioStreamBuilder,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGenerate", nullptr, AudioCaptureGenerate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGenerateErr", nullptr, AudioCaptureGenerateErr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureStart", nullptr, AudioCaptureStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureStartErr", nullptr, AudioCaptureStartErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturePause", nullptr, AudioCapturePause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturePauseErr", nullptr, AudioCapturePauseErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureStop", nullptr, AudioCaptureStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureStopErr", nullptr, AudioCaptureStopErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureFlush", nullptr, AudioCaptureFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureFlushErr", nullptr, AudioCaptureFlushErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureRelease", nullptr, AudioCaptureRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureReleaseErr", nullptr, AudioCaptureReleaseErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetParameter", nullptr, AudioCaptureGetParameter,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetCurrentState", nullptr, AudioCaptureGetCurrentState,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetStreamId", nullptr, AudioCaptureGetStreamId,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetSamplingRate", nullptr, AudioCaptureGetSamplingRate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetSampleFormat", nullptr, AudioCaptureGetSampleFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetEncodingType", nullptr, AudioCaptureGetEncodingType,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetCapturerInfo", nullptr, AudioCaptureGetCapturerInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetTimestamp", nullptr, AudioCaptureGetTimestamp,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetFramesRead", nullptr, AudioCaptureGetFramesRead,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetFrameSizeInCallback", nullptr, AudioCaptureGetFrameSizeInCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetSpeed", nullptr, AudioRendererSetSpeed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererGetSpeed", nullptr, AudioRendererGetSpeed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetGetSpeed", nullptr, AudioRendererSetGetSpeed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioSetRendererOutputDeviceChangeCallback", nullptr, AudioSetRendererOutputDeviceChangeCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetFramesWritten", nullptr, AudioRenderGetFramesWritten,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetTimestamp", nullptr, AudioRenderGetTimestamp,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetFrameSizeInCallback", nullptr, AudioRenderGetFrameSizeInCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGenerate", nullptr, AudioRenderGenerate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGenerateErr", nullptr, AudioRenderGenerateErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderStart", nullptr, AudioRenderStart, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderStartErr", nullptr, AudioRenderStartErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderPause", nullptr, AudioRenderPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderPauseErr", nullptr, AudioRenderPauseErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderStop", nullptr, AudioRenderStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderStopErr", nullptr, AudioRenderStopErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderFlush", nullptr, AudioRenderFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderFlushErr", nullptr, AudioRenderFlushErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderRelease", nullptr, AudioRenderRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderReleaseErr", nullptr, AudioRenderReleaseErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetCurrentState", nullptr, AudioRenderGetCurrentState,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetParameter", nullptr, AudioRenderGetParameter,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetStreamId", nullptr, AudioRenderGetStreamId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetSamplingRate", nullptr, AudioRenderGetSamplingRate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetSampleFormat", nullptr, AudioRenderGetSampleFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetEncodingType", nullptr, AudioRenderGetEncodingType,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetRendererInfo", nullptr, AudioRenderGetRendererInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetSamplingRate", nullptr, AudioStreamBuilderSetSamplingRate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetChannelCount", nullptr, AudioStreamBuilderSetChannelCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetSampleFormat", nullptr, AudioStreamBuilderSetSampleFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetEncodingType", nullptr, AudioStreamBuilderSetEncodingType,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetLatencyMode", nullptr, AudioStreamBuilderSetLatencyMode,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetRendererInfo", nullptr, AudioStreamBuilderSetRendererInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetCapturerInfo", nullptr, AudioStreamBuilderSetCapturerInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetRendererCallback", nullptr, AudioStreamBuilderSetRendererCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetCapturerCallback", nullptr, AudioStreamBuilderSetCapturerCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCaptureGetChannelCount", nullptr, AudioCaptureGetChannelCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRenderGetChannelCount", nullptr, AudioRenderGetChannelCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetFrameSizeInCallback", nullptr, AudioStreamBuilderSetFrameSizeInCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererGetVolume_01", nullptr, AudioRendererGetVolume_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolume_01", nullptr, AudioRendererSetVolume_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolume_02", nullptr, AudioRendererSetVolume_02,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolume_03", nullptr, AudioRendererSetVolume_03,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolume_04", nullptr, AudioRendererSetVolume_04,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolume_05", nullptr, AudioRendererSetVolume_05,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolume_06", nullptr, AudioRendererSetVolume_06,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_01", nullptr, AudioRendererSetVolumeWithRamp_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_02", nullptr, AudioRendererSetVolumeWithRamp_02,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_03", nullptr, AudioRendererSetVolumeWithRamp_03,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_04", nullptr, AudioRendererSetVolumeWithRamp_04,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_05", nullptr, AudioRendererSetVolumeWithRamp_05,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_06", nullptr, AudioRendererSetVolumeWithRamp_06,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_07", nullptr, AudioRendererSetVolumeWithRamp_07,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_08", nullptr, AudioRendererSetVolumeWithRamp_08,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetVolumeWithRamp_09", nullptr, AudioRendererSetVolumeWithRamp_09,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_01", nullptr, AudioRendererSetOnMarkReached_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_02", nullptr, AudioRendererSetOnMarkReached_02,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_03", nullptr, AudioRendererSetOnMarkReached_03,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_04", nullptr, AudioRendererSetOnMarkReached_04,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_05", nullptr, AudioRendererSetOnMarkReached_05,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_06", nullptr, AudioRendererSetOnMarkReached_06,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_07", nullptr, AudioRendererSetOnMarkReached_07,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetOnMarkReached_08", nullptr, AudioRendererSetOnMarkReached_08,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererCancelMark_01", nullptr, AudioRendererCancelMark_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererCancelMark_02", nullptr, AudioRendererCancelMark_02,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererCancelMark_03", nullptr, AudioRendererCancelMark_03,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetInterruptMode_01", nullptr, AudioRendererSetInterruptMode_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetInterruptMode_02", nullptr, AudioRendererSetInterruptMode_02,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetInterruptMode_03", nullptr, AudioRendererSetInterruptMode_03,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetInterruptMode_04", nullptr, AudioRendererSetInterruptMode_04,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioManagerGetAudioRoutingManager_01", nullptr, AudioManagerGetAudioRoutingManager_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_01", nullptr, AudioRoutingManagerGetDevices_01,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_02", nullptr, AudioRoutingManagerGetDevices_02,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_03", nullptr, AudioRoutingManagerGetDevices_03,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_04", nullptr, AudioRoutingManagerGetDevices_04,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_05", nullptr, AudioRoutingManagerGetDevices_05,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_06", nullptr, AudioRoutingManagerGetDevices_06,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetDevices_07", nullptr, AudioRoutingManagerGetDevices_07,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioManagerGetManager_01", nullptr, AudioManagerGetManager_01, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"audioManagerGetManager_02", nullptr, AudioManagerGetManager_02, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"audioManagerGetAudioScene_01", nullptr, AudioManagerGetAudioScene_01, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"audioManagerGetAudioScene_02", nullptr, AudioManagerGetAudioScene_02, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"audioRoutingManagerGetAvailableDevices001", nullptr, AudioRoutingManagerGetAvailableDevices001, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetPreferredOutputDevice001", nullptr, AudioRoutingManagerGetPreferredOutputDevice001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerGetPreferredInputDevice001", nullptr, AudioRoutingManagerGetPreferredInputDevice001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_001", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_002", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_003", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_004", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_005", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_006", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_007", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerRegisterDeviceChangeCallback_008", nullptr,
            AudioRoutingManagerRegisterDeviceChangeCallback_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerUnregisterDeviceChangeCallback_001", nullptr,
            AudioRoutingManagerUnregisterDeviceChangeCallback_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerUnregisterDeviceChangeCallback_002", nullptr,
            AudioRoutingManagerUnregisterDeviceChangeCallback_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerUnregisterDeviceChangeCallback_003", nullptr,
            AudioRoutingManagerUnregisterDeviceChangeCallback_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerReleaseDevices_001", nullptr, AudioRoutingManagerReleaseDevices_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRoutingManagerReleaseDevices_002", nullptr, AudioRoutingManagerReleaseDevices_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceType_001", nullptr, AudioAudioDeviceDescriptorGetDeviceType_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceType_002", nullptr, AudioAudioDeviceDescriptorGetDeviceType_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceType_003", nullptr, AudioAudioDeviceDescriptorGetDeviceType_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceRole_001", nullptr, AudioAudioDeviceDescriptorGetDeviceRole_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceRole_002", nullptr, AudioAudioDeviceDescriptorGetDeviceRole_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceRole_003", nullptr, AudioAudioDeviceDescriptorGetDeviceRole_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceId_001", nullptr, AudioAudioDeviceDescriptorGetDeviceId_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceId_002", nullptr, AudioAudioDeviceDescriptorGetDeviceId_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceId_003", nullptr, AudioAudioDeviceDescriptorGetDeviceId_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceName_001", nullptr, AudioAudioDeviceDescriptorGetDeviceName_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceName_002", nullptr, AudioAudioDeviceDescriptorGetDeviceName_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceName_003", nullptr, AudioAudioDeviceDescriptorGetDeviceName_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceAddress_001", nullptr, AudioAudioDeviceDescriptorGetDeviceAddress_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceAddress_002", nullptr, AudioAudioDeviceDescriptorGetDeviceAddress_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceAddress_003", nullptr, AudioAudioDeviceDescriptorGetDeviceAddress_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceSampleRates_001", nullptr,
            AudioAudioDeviceDescriptorGetDeviceSampleRates_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceSampleRates_002", nullptr,
            AudioAudioDeviceDescriptorGetDeviceSampleRates_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceSampleRates_003", nullptr,
            AudioAudioDeviceDescriptorGetDeviceSampleRates_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceSampleRates_004", nullptr,
            AudioAudioDeviceDescriptorGetDeviceSampleRates_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceChannelCounts_001", nullptr,
            AudioAudioDeviceDescriptorGetDeviceChannelCounts_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceChannelCounts_002", nullptr,
            AudioAudioDeviceDescriptorGetDeviceChannelCounts_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceChannelCounts_003", nullptr,
            AudioAudioDeviceDescriptorGetDeviceChannelCounts_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceChannelCounts_004", nullptr,
            AudioAudioDeviceDescriptorGetDeviceChannelCounts_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceDisplayName_001", nullptr,
            AudioAudioDeviceDescriptorGetDeviceDisplayName_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceDisplayName_002", nullptr,
            AudioAudioDeviceDescriptorGetDeviceDisplayName_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceDisplayName_003", nullptr,
            AudioAudioDeviceDescriptorGetDeviceDisplayName_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceEncodingTypes_001", nullptr,
            AudioAudioDeviceDescriptorGetDeviceEncodingTypes_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceEncodingTypes_002", nullptr,
            AudioAudioDeviceDescriptorGetDeviceEncodingTypes_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceEncodingTypes_003", nullptr,
            AudioAudioDeviceDescriptorGetDeviceEncodingTypes_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioDeviceDescriptorGetDeviceEncodingTypes_004", nullptr,
            AudioAudioDeviceDescriptorGetDeviceEncodingTypes_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioInternalRecordingSuccess01", nullptr,
            AudioAudioInternalRecordingSuccess01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioInternalRecordingSuccess02", nullptr,
            AudioAudioInternalRecordingSuccess02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioAudioInternalRecordingFalse", nullptr,
            AudioAudioInternalRecordingFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetRendererWriteDataCallback_001", nullptr,
            AudioStreamBuilderSetRendererWriteDataCallback_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioStreamBuilderSetRendererWriteDataCallback_002", nullptr,
            AudioStreamBuilderSetRendererWriteDataCallback_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioCapturerGetOverflowCount_001", nullptr,
            audioCapturerGetOverflowCount_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStrategy_001", nullptr,
            AudioSessionManagerStrategy_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStrategy_002", nullptr,
            AudioSessionManagerStrategy_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStrategy_003", nullptr,
            AudioSessionManagerStrategy_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStrategy_004", nullptr,
            AudioSessionManagerStrategy_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStrategyError_001", nullptr,
            AudioSessionManagerStrategyError_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerActivatedError_001", nullptr,
            AudioSessionManagerActivatedError_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStopError_001", nullptr,
            AudioSessionManagerStopError_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerStopError_002", nullptr,
            AudioSessionManagerStopError_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerRegisterError_001", nullptr,
            AudioSessionManagerRegisterError_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerRegisterError_002", nullptr,
            AudioSessionManagerRegisterError_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerUnregisterError_001", nullptr,
            AudioSessionManagerUnregisterError_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerUnregisterError_002", nullptr,
            AudioSessionManagerUnregisterError_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerReason_001", nullptr,
            AudioSessionManagerReason_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioSessionManagerReason_002", nullptr,
            AudioSessionManagerReason_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetDefaultOutputDevice_01", nullptr,
            AudioRendererSetDefaultOutputDevice_01, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetDefaultOutputDevice_02", nullptr,
            AudioRendererSetDefaultOutputDevice_02, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"audioRendererSetDefaultOutputDevice_03", nullptr,
            AudioRendererSetDefaultOutputDevice_03, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/*

 * module define
 */
static napi_module g_module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "audioNdkTest",
    .nm_priv = ((void *)0),
    .reserved = {0}};

/*
 * module register
 */
extern "C" __attribute__((constructor)) void MyPixelMapRegisterModule(void)
{
    napi_module_register(&g_module);
}