/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <cstddef>
#include <cstdint>
#include <cstdio>
#define LOG_TAG "PipWindow_NDK"
#include <hilog/log.h>
#include <window_manager/oh_window_pip.h>

constexpr int32_t FAIL = -1;
constexpr int32_t SUCCESS = 0;
int32_t timer1 = 0;
int32_t timer2 = 0;
int32_t timer3 = 0;
int32_t timer4 = 0;
int32_t timer5 = 0;
int32_t timer6 = 0;
int32_t timer7 = 0;
int32_t timer8 = 0;
uint32_t controllerIdCallback1 = 0;
uint32_t controllerIdCallback2 = 0;
uint32_t controllerIdCallback3 = 0;
uint32_t controllerIdCallback4 = 0;
uint32_t controllerIdCallback5 = 0;
uint32_t controllerIdCallback6 = 0;
uint32_t controllerIdCallback7 = 0;
uint32_t controllerIdCallback8 = 0;

static napi_value TestPipTemplateTypeEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    napi_value enum1;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_PLAY, &enum1);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_PLAY=%{public}d",
      PictureInPicture_PipTemplateType::VIDEO_PLAY);
    napi_set_named_property(env, result, "VIDEO_PLAY", enum1);
    napi_value enum2;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_CALL, &enum2);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_CALL=%{public}d",
      PictureInPicture_PipTemplateType::VIDEO_CALL);
    napi_set_named_property(env, result, "VIDEO_CALL", enum2);
    napi_value enum3;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_MEETING, &enum3);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_MEETING=%{public}d",
      PictureInPicture_PipTemplateType::VIDEO_MEETING);
    napi_set_named_property(env, result, "VIDEO_MEETING", enum3);
    napi_value enum4;
    napi_create_int32(env, PictureInPicture_PipTemplateType::VIDEO_LIVE, &enum4);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipTemplateType::VIDEO_LIVE=%{public}d",
      PictureInPicture_PipTemplateType::VIDEO_LIVE);
    napi_set_named_property(env, result, "VIDEO_LIVE", enum4);
    return result;
}

static napi_value TestPipControlGroupEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_PLAY_VIDEO_PREVIOUS_NEXT=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_PLAY_VIDEO_PREVIOUS_NEXT);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_MICROPHONE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_MICROPHONE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_HANG_UP_BUTTON=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_HANG_UP_BUTTON);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_CAMERA_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_CAMERA_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_CALL_MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_CALL_MUTE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_HANG_UP_BUTTON=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_HANG_UP_BUTTON);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_CAMERA_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_CAMERA_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MUTE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_MEETING_MICROPHONE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MICROPHONE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_LIVE_VIDEO_PLAY_PAUSE=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_LIVE_VIDEO_PLAY_PAUSE);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlGroup::VIDEO_LIVE_MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlGroup::VIDEO_LIVE_MUTE_SWITCH);
    if (PictureInPicture_PipControlGroup::VIDEO_PLAY_VIDEO_PREVIOUS_NEXT != 101 ||
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD != 102 ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_MICROPHONE_SWITCH != 201 ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_HANG_UP_BUTTON != 202 ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_CAMERA_SWITCH != 203 ||
        PictureInPicture_PipControlGroup::VIDEO_CALL_MUTE_SWITCH != 204 ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_HANG_UP_BUTTON != 301 ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_CAMERA_SWITCH != 302 ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MUTE_SWITCH != 303 ||
        PictureInPicture_PipControlGroup::VIDEO_MEETING_MICROPHONE_SWITCH != 304 ||
        PictureInPicture_PipControlGroup::VIDEO_LIVE_VIDEO_PLAY_PAUSE != 401 ||
        PictureInPicture_PipControlGroup::VIDEO_LIVE_MUTE_SWITCH != 402) {
         napi_create_int32(env, FAIL, &result);
         return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestPipControlTypeEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::VIDEO_PLAY_PAUSE=%{public}d",
        PictureInPicture_PipControlType::VIDEO_PLAY_PAUSE);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::VIDEO_PREVIOUS=%{public}d",
        PictureInPicture_PipControlType::VIDEO_PREVIOUS);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::VIDEO_NEXT=%{public}d",
        PictureInPicture_PipControlType::VIDEO_NEXT);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::FAST_FORWARD=%{public}d",
        PictureInPicture_PipControlType::FAST_FORWARD);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::FAST_BACKWARD=%{public}d",
        PictureInPicture_PipControlType::FAST_BACKWARD);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::HANG_UP_BUTTON=%{public}d",
        PictureInPicture_PipControlType::HANG_UP_BUTTON);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::MICROPHONE_SWITCH=%{public}d",
        PictureInPicture_PipControlType::MICROPHONE_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::CAMERA_SWITCH=%{public}d",
        PictureInPicture_PipControlType::CAMERA_SWITCH);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlType::MUTE_SWITCH=%{public}d",
        PictureInPicture_PipControlType::MUTE_SWITCH);
    
    if (PictureInPicture_PipControlType::VIDEO_PLAY_PAUSE != 0 ||
        PictureInPicture_PipControlType::VIDEO_PREVIOUS != 1 ||
        PictureInPicture_PipControlType::VIDEO_NEXT != 2 ||
        PictureInPicture_PipControlType::FAST_FORWARD != 3 ||
        PictureInPicture_PipControlType::FAST_BACKWARD != 4 ||
        PictureInPicture_PipControlType::HANG_UP_BUTTON != 5 ||
        PictureInPicture_PipControlType::MICROPHONE_SWITCH != 6 ||
        PictureInPicture_PipControlType::CAMERA_SWITCH != 7 ||
        PictureInPicture_PipControlType::MUTE_SWITCH != 8) {
         napi_create_int32(env, FAIL, &result);
         return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestPipControlStatusEnum(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::PLAY=%{public}d",
        PictureInPicture_PipControlStatus::PLAY);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::PAUSE=%{public}d",
        PictureInPicture_PipControlStatus::PAUSE);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::OPEN=%{public}d",
        PictureInPicture_PipControlStatus::OPEN);
    OH_LOG_INFO(LOG_APP, "PictureInPicture_PipControlStatus::CLOSE=%{public}d",
        PictureInPicture_PipControlStatus::CLOSE);
    
    if (PictureInPicture_PipControlStatus::PLAY != 1 ||
        PictureInPicture_PipControlStatus::PAUSE != 0 ||
        PictureInPicture_PipControlStatus::OPEN != 1 ||
        PictureInPicture_PipControlStatus::CLOSE != 0) {
         napi_create_int32(env, FAIL, &result);
         return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestCreatePip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestCreatePip_ControllerId_Nullptr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestCreatePip_SetPipMainWindowId_Zero(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestCreatePip_SetErrPipTemplateType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_CALL;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    int32_t ret = OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestStartStopPip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    int32_t ret = OH_PictureInPicture_StartPip(controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestStartPipRepeat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_StartPip(controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestStopPipRepeat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestDeletePipWithStopPip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    OH_PictureInPicture_StopPip(controllerId);
    int32_t ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestDeletePipWithoutStopPip(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestUpdatePipContentSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_StartPip(controllerId);
    int32_t ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 1, 1);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestUpdatePipContentStatus(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    int32_t ret0 = OH_PictureInPicture_StartPip(controllerId);
    OH_LOG_INFO(LOG_APP, "ret0=%{public}d", ret0);
    if (ret0 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    uint32_t controlType = 0;
    uint32_t status = 1;
    uint32_t status2 = 0;
    int32_t ret = OH_PictureInPicture_UpdatePipControlStatus(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType),
        static_cast<PictureInPicture_PipControlStatus>(status));
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret2 = OH_PictureInPicture_SetPipControlEnabled(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType), status2);
    OH_LOG_INFO(LOG_APP, "ret2=%{public}d", ret2);
    if (ret2 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUpdatePipContentEnabled(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    int32_t ret0 = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "ret0=%{public}d", ret0);
    if (ret0 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    uint32_t controlType = 0;
    int32_t ret = OH_PictureInPicture_SetPipControlEnabled(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType), 1);
    OH_LOG_INFO(LOG_APP, "ret=%{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret2 = OH_PictureInPicture_SetPipControlEnabled(controllerId,
        static_cast<PictureInPicture_PipControlType>(controlType), 0);
    OH_LOG_INFO(LOG_APP, "ret2=%{public}d", ret2);
    if (ret2 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
   
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipStartPipCallback1(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    timer1++;
    controllerIdCallback1 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback1 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback1 surfaceId=%{public}lu.", surfaceId);
}

void WebPipStartPipUnRegisterCallback1(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    timer1--;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback1 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback1 surfaceId=%{public}lu.", surfaceId);
}

void WebPipStartPipCallback2(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    timer2++;
    controllerIdCallback2 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback2 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipCallback2 surfaceId=%{public}lu.", surfaceId);
}

void WebPipStartPipUnRegisterCallback2(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    timer2--;
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback2 requestId=%{public}lu.", requestId);
    OH_LOG_INFO(LOG_APP, "WebPipStartPipUnRegisterCallback2 surfaceId=%{public}lu.", surfaceId);
}

static napi_value TestRegisterStartPipCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterStartPipCallback timer1=%{public}d",timer1);
    if (ret != 0 || timer1 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterStartPipCallback(controllerIdCallback1, WebPipStartPipUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestTwoRegisterStartPipCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback2);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback timer1=%{public}d",timer1);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterStartPipCallback timer2=%{public}d",timer2);
    if (ret != 0 || timer1 != 1 || timer2 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterStartPipCallback(controllerIdCallback1, WebPipStartPipUnRegisterCallback1);
    OH_PictureInPicture_UnregisterStartPipCallback(controllerIdCallback2, WebPipStartPipUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterStartPipCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback2);
    OH_PictureInPicture_UnregisterStartPipCallback(controllerIdCallback1, WebPipStartPipUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback timer1=%{public}d",timer1);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback timer2=%{public}d",timer2);
    if (ret != 0 || timer1 != 0 || timer2 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterStartPipCallback(controllerIdCallback2, WebPipStartPipUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllStartPipCallbacks(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback1);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallback2);
    OH_PictureInPicture_UnregisterAllStartPipCallbacks(controllerIdCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback timer1=%{public}d",timer1);
    OH_LOG_INFO(LOG_APP, "TestUnregisterStartPipCallback timer2=%{public}d",timer2);
    if (ret != 0 || timer1 != 0 || timer2 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipResizeCallback1(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    timer3++;
    controllerIdCallback3 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback1 scale=%{public}lu.", scale);
}

void WebPipResizeUnRegisterCallback1(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    timer3--;
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback1 scale=%{public}lu.", scale);
}

void WebPipResizeCallback2(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    timer4++;
    controllerIdCallback4 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeCallback2 scale=%{public}lu.", scale);
}

void WebPipResizeUnRegisterCallback2(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    timer4--;
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 width=%{public}lu.", width);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 height=%{public}lu.", height);
    OH_LOG_INFO(LOG_APP, "WebPipResizeUnRegisterCallback2 scale=%{public}lu.", scale);
}

static napi_value TestRegisterResizeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener timer3=%{public}d", timer3);
    if (ret != 0 || timer3 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterResizeListener(controllerIdCallback3, WebPipResizeUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestTwoRegisterResizeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback2);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener timer3=%{public}d", timer3);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterResizeListener timer4=%{public}d", timer4);
    if (ret != 0 || timer3 != 1 || timer4 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterResizeListener(controllerIdCallback3, WebPipResizeUnRegisterCallback1);
    OH_PictureInPicture_UnregisterResizeListener(controllerIdCallback4, WebPipResizeUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterResizeListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback2);
    OH_PictureInPicture_UnregisterResizeListener(controllerIdCallback3, WebPipResizeUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener timer3=%{public}d", timer3);
    OH_LOG_INFO(LOG_APP, "TestUnregisterResizeListener timer4=%{public}d", timer4);
    if (ret != 0 || timer1 != 0 || timer4 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterResizeListener(controllerIdCallback4, WebPipResizeUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllResizeListeners(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback1);
    OH_PictureInPicture_UnregisterAllResizeListeners(controllerIdCallback3);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners timer3=%{public}d", timer3);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllResizeListeners timer4=%{public}d", timer4);
    if (ret != 0 || timer3 != 0 || timer4 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipControlEventCallback1(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    timer5++;
    controllerIdCallback5 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback1 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback1 status=%{public}lu.", status);
}

void WebPipControlEventUnRegisterCallback1(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    timer5--;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback1 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback1 status=%{public}lu.", status);
}

void WebPipControlEventCallback2(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    timer6++;
    controllerIdCallback6 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback2 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventCallback2 status=%{public}lu.", status);
}

void WebPipControlEventUnRegisterCallback2(uint32_t controllerId, PictureInPicture_PipControlType controlType,
    PictureInPicture_PipControlStatus status)
{
    timer6--;
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback2 controlType=%{public}lu.", controlType);
    OH_LOG_INFO(LOG_APP, "WebPipControlEventUnRegisterCallback2 status=%{public}lu.", status);
}

static napi_value TestRegisterControlEventListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterControlEventListener timer5=%{public}d", timer5);
    if (ret != 0 || timer5 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterControlEventListener(controllerIdCallback5, WebPipControlEventUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterControlEventListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback1);
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback2);
    OH_PictureInPicture_UnregisterControlEventListener(controllerIdCallback5, WebPipControlEventUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener timer5=%{public}d", timer5);
    OH_LOG_INFO(LOG_APP, "TestUnregisterControlEventListener timer6=%{public}d", timer6);
    if (ret != 0 || timer5 != 0 || timer6 != 1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterControlEventListener(controllerIdCallback6, WebPipControlEventUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllControlEventListeners(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback1);
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallback2);
    OH_PictureInPicture_UnregisterAllControlEventListeners(controllerIdCallback5);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_UpdatePipContentSize(controllerId, 50, 50);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_UpdatePipContentSize ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners timer5=%{public}d", timer5);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllControlEventListeners timer6=%{public}d", timer6);
    if (ret != 0 || timer5 != 0 || timer6 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void WebPipLifecycleCallback1(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    timer7++;
    controllerIdCallback7 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback1 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback1 errcode=%{public}lu.", errcode);
}

void WebPipLifecycleUnRegisterCallback1(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    timer7 = timer7 - 2;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback1 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback1 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback1 errcode=%{public}lu.", errcode);
}

void WebPipLifecycleCallback2(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    timer8++;
    controllerIdCallback8 = controllerId;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback2 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleCallback2 errcode=%{public}lu.", errcode);
}

void WebPipLifecycleUnRegisterCallback2(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    timer8 = timer8 - 2;
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback2 controllerId=%{public}lu.", controllerId);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback2 state=%{public}lu.", state);
    OH_LOG_INFO(LOG_APP, "WebPipLifecycleUnRegisterCallback2 errcode=%{public}lu.", errcode);
}

static napi_value TestRegisterLifeCycleListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestRegisterResizeListener timer7=%{public}d", timer7);
    if (ret != 0 || timer7 != 2) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterLifecycleListener(controllerIdCallback7, WebPipLifecycleUnRegisterCallback1);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestTwoRegisterLifeCycleListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback2);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener timer7=%{public}d", timer7);
    OH_LOG_INFO(LOG_APP, "TestTwoRegisterLifeCycleListener timer8=%{public}d", timer8);
    if (ret != 0 || timer7 != 2 || timer8 != 2) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterLifecycleListener(controllerIdCallback7, WebPipLifecycleUnRegisterCallback1);
    OH_PictureInPicture_UnregisterLifecycleListener(controllerIdCallback8, WebPipLifecycleUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterLifeCycleListener(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback2);
    OH_PictureInPicture_UnregisterLifecycleListener(controllerIdCallback7, WebPipLifecycleUnRegisterCallback1);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener timer7=%{public}d", timer7);
    OH_LOG_INFO(LOG_APP, "TestUnregisterLifeCycleListener timer8=%{public}d", timer8);
    if (ret != 0 || timer7 != 0 || timer8 != 2) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_PictureInPicture_UnregisterLifecycleListener(controllerIdCallback8, WebPipLifecycleUnRegisterCallback2);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value TestUnregisterAllLifeCycleListeners(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    uint32_t mainWindowId;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_uint32(env, args[0], &mainWindowId);
    OH_LOG_INFO(LOG_APP, "mainWindowId =%{public}d.", mainWindowId);
    napi_value result;
    PictureInPicture_PipControlGroup controlGroup[1] = {
        PictureInPicture_PipControlGroup::VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    PictureInPicture_PipTemplateType pipTemplateType = PictureInPicture_PipTemplateType::VIDEO_PLAY;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, pipTemplateType);
    OH_PictureInPicture_SetPipRect(pipConfig, 9, 16);
    OH_PictureInPicture_SetPipControlGroup(pipConfig, controlGroup, 1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    uint32_t controllerId = 0;
    OH_PictureInPicture_CreatePip(pipConfig, &controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback1);
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallback2);
    OH_PictureInPicture_UnregisterAllLifecycleListeners(controllerIdCallback7);
    
    int32_t ret = OH_PictureInPicture_StartPip(0);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StartPip ret=%{public}d", ret);
    
    ret = OH_PictureInPicture_StopPip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_StopPip ret=%{public}d", ret);
    ret = OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_INFO(LOG_APP, "OH_PictureInPicture_DeletePip ret=%{public}d", ret);
    
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners timer7=%{public}d", timer7);
    OH_LOG_INFO(LOG_APP, "TestUnregisterAllLifeCycleListeners timer8=%{public}d", timer8);
    if (ret != 0 || timer7 != 0 || timer8 != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "testPipTemplateTypeEnum", nullptr, TestPipTemplateTypeEnum, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipControlGroupEnum", nullptr, TestPipControlGroupEnum, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipControlTypeEnum", nullptr, TestPipControlTypeEnum, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testPipControlStatusEnum", nullptr, TestPipControlStatusEnum, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip", nullptr, TestCreatePip, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip_ControllerId_Nullptr", nullptr, TestCreatePip_ControllerId_Nullptr, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip_SetPipMainWindowId_Zero", nullptr, TestCreatePip_SetPipMainWindowId_Zero, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testCreatePip_SetErrPipTemplateType", nullptr, TestCreatePip_SetErrPipTemplateType, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStartStopPip", nullptr, TestStartStopPip, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStartPipRepeat", nullptr, TestStartPipRepeat, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStopPipRepeat", nullptr, TestStopPipRepeat, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testDeletePipWithStopPip", nullptr, TestDeletePipWithStopPip, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testDeletePipWithoutStopPip", nullptr, TestDeletePipWithoutStopPip, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUpdatePipContentSize", nullptr, TestUpdatePipContentSize, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUpdatePipContentStatus", nullptr, TestUpdatePipContentStatus, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUpdatePipContentEnabled", nullptr, TestUpdatePipContentEnabled, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterStartPipCallback", nullptr, TestRegisterStartPipCallback, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testTwoRegisterStartPipCallback", nullptr, TestTwoRegisterStartPipCallback, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterStartPipCallback", nullptr, TestUnregisterStartPipCallback, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllStartPipCallbacks", nullptr, TestUnregisterAllStartPipCallbacks, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterResizeListener", nullptr, TestRegisterResizeListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testTwoRegisterResizeListener", nullptr, TestTwoRegisterResizeListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterResizeListener", nullptr, TestUnregisterResizeListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllResizeListeners", nullptr, TestUnregisterAllResizeListeners, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterControlEventListener", nullptr, TestRegisterControlEventListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterControlEventListener", nullptr, TestUnregisterControlEventListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllControlEventListeners", nullptr, TestUnregisterAllControlEventListeners, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testRegisterLifeCycleListener", nullptr, TestRegisterLifeCycleListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testTwoRegisterLifeCycleListener", nullptr, TestTwoRegisterLifeCycleListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterLifeCycleListener", nullptr, TestUnregisterLifeCycleListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testUnregisterAllLifeCycleListeners", nullptr, TestUnregisterAllLifeCycleListeners, nullptr, nullptr, nullptr, napi_default, nullptr },
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
