/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include "hilog/log.h"
#include <bits/alltypes.h>
#include <thread>
#include <iostream>

#undef LOG_TAG
#define LOG_TAG "MMI"

const int GLOBAL_RESMGR = 0xFF00;
const char *TAG = "[SensorCapiSample]";

static napi_value CreateKeyState(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    napi_create_int32(env, keyState != nullptr ? 1 : 0, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

static napi_value DestroyKeyState(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_DestroyKeyState(&keyState);
    napi_create_int32(env, keyState == nullptr ? 1 : 0, &result);
    return result;
}

static napi_value SetKeyCode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, value0);
    int32_t keyCode = OH_Input_GetKeyCode(keyState);
    napi_create_int32(env, keyCode == value0 ? 1 : 0, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

static napi_value SetKeyPressed(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyPressed(keyState, value0);
    int32_t keyAction = OH_Input_GetKeyPressed(keyState);
    napi_create_int32(env, keyAction == value0 ? 1 : 0, &result);
    return result;
}

static napi_value SetKeySwitch(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeySwitch(keyState, value0);
    int32_t keySwitch = OH_Input_GetKeySwitch(keyState);
    napi_create_int32(env, keySwitch == value0 ? 1 : 0, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

static napi_value GetKeyPressed(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, value0);
    OH_Input_GetKeyState(keyState);
    int32_t keyPressed = OH_Input_GetKeyPressed(keyState);
    napi_create_int32(env, keyPressed == KEY_RELEASED ? 1 : 0, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

static napi_value GetKeySwitch(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, value0);
    OH_Input_GetKeyState(keyState);
    int32_t keySwitch = OH_Input_GetKeySwitch(keyState);
    napi_create_int32(env, keySwitch == KEY_DEFAULT ? 1 : 0, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

static napi_value GetKeyState(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyState *keyState = OH_Input_CreateKeyState();
    OH_Input_SetKeyCode(keyState, value0);
    OH_Input_GetKeyState(keyState);
    int32_t keyStateValue = OH_Input_GetKeyState(keyState);
    napi_create_int32(env, keyStateValue == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_DestroyKeyState(&keyState);
    return result;
}

static napi_value CreateKeyEvent(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    napi_create_int32(env, keyEvent != nullptr ? 1 : 0, &result);
    return result;
}

static napi_value InjectKeyEvent(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_UNKNOWN);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    int32_t retResult = OH_Input_InjectKeyEvent(keyEvent);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

static napi_value DestroyKeyEvent(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_UNKNOWN);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    OH_Input_InjectKeyEvent(keyEvent);
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_UP);
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_UNKNOWN);
    OH_Input_SetKeyEventActionTime(keyEvent, -1);
    OH_Input_InjectKeyEvent(keyEvent);
    OH_Input_CancelInjection();
    OH_Input_DestroyKeyEvent(&keyEvent);
    napi_create_int32(env, keyEvent == nullptr ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyEventAction(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    int32_t action = OH_Input_GetKeyEventAction(keyEvent);
    napi_create_int32(env, action == KEY_ACTION_DOWN ? 1 : 0, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

static napi_value GetKeyEventActionDestroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventAction(keyEvent, KEY_ACTION_DOWN);
    OH_Input_GetKeyEventAction(keyEvent);
    OH_Input_DestroyKeyEvent(&keyEvent);
    napi_create_int32(env, keyEvent == nullptr ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyEventKeyCode(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_A);
    int32_t keyCode = OH_Input_GetKeyEventKeyCode(keyEvent);
    napi_create_int32(env, keyCode == KEYCODE_A ? 1 : 0, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

static napi_value GetKeyEventKeyCodeDestroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventKeyCode(keyEvent, KEYCODE_A);
    OH_Input_GetKeyEventKeyCode(keyEvent);
    OH_Input_DestroyKeyEvent(&keyEvent);
    napi_create_int32(env, keyEvent == nullptr ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyEventActionTime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventActionTime(keyEvent, value0);
    int64_t actionTime = OH_Input_GetKeyEventActionTime(keyEvent);
    napi_create_int32(env, actionTime == value0 ? 1 : 0, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

static napi_value GetKeyEventActionTimeDestroy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    
    napi_value result;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_SetKeyEventActionTime(keyEvent, value0);
    OH_Input_GetKeyEventActionTime(keyEvent);
    OH_Input_DestroyKeyEvent(&keyEvent);
    napi_create_int32(env, keyEvent == nullptr ? 1 : 0, &result);
    return result;
}

static napi_value createTouchEvent(napi_env env, napi_callback_info info)
{
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    napi_value result;
    napi_create_int32(env, touchEvent == nullptr, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value destroyTouchEvent(napi_env env, napi_callback_info info)
{
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    napi_value result;
    OH_Input_DestroyTouchEvent(&touchEvent);
    napi_create_int32(env, touchEvent == nullptr, &result);
    return result;
}

static napi_value touchEventAction(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetTouchEventAction(touchEvent), &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value touchEventFingerId(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventFingerId(touchEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetTouchEventFingerId(touchEvent), &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value touchEventDisplayX(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventDisplayX(touchEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetTouchEventDisplayX(touchEvent), &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value touchEventDisplayY(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventDisplayY(touchEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetTouchEventDisplayY(touchEvent), &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value touchEventActionTime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventActionTime(touchEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetTouchEventActionTime(touchEvent), &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value injectTouchEvent(napi_env env, napi_callback_info info)
{
	size_t argc = 2;
    napi_value args[2] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    int value1;
    napi_get_value_int32(env, args[0], &value1);
	
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, TOUCH_ACTION_DOWN);
    OH_Input_SetTouchEventFingerId(touchEvent, 0);
    OH_Input_SetTouchEventDisplayX(touchEvent, value0);
    OH_Input_SetTouchEventDisplayY(touchEvent, value1);
    OH_Input_SetTouchEventActionTime(touchEvent, -1);
    napi_value result;
    napi_create_int32(env, OH_Input_InjectTouchEvent(touchEvent), &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value createMouseEvent(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    napi_value result;
    napi_create_int32(env, mouseEvent == nullptr, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value destroyMouseEvent(napi_env env, napi_callback_info info)
{
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_DestroyMouseEvent(&mouseEvent);
    napi_value result;
    napi_create_int32(env, mouseEvent == nullptr, &result);
    return result;
}

static napi_value mouseEventAction(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventAction(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value mouseEventDisplayX(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventDisplayX(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventDisplayX(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value mouseEventDisplayY(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventDisplayY(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventDisplayY(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value mouseEventButton(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventButton(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventButton(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value mouseEventAxisType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAxisType(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventAxisType(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value mouseEventAxisValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    double value0;
    napi_get_value_double(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAxisValue(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventAxisValue(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value mouseEventActionTime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
	
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventActionTime(mouseEvent, value0);
    napi_value result;
    napi_create_int32(env, OH_Input_GetMouseEventActionTime(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value injectMouseEvent(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
	
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
	
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);
	
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    int value1;
    napi_get_value_int32(env, args[0], &value1);
	
	struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, MOUSE_ACTION_MOVE);
    OH_Input_SetMouseEventDisplayX(mouseEvent, value0);
    OH_Input_SetMouseEventDisplayY(mouseEvent, value0);
    OH_Input_SetMouseEventButton(mouseEvent, value1);
    OH_Input_SetMouseEventActionTime(mouseEvent, -1);
    napi_value result;
    napi_create_int32(env, OH_Input_InjectMouseEvent(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value RegisterDeviceListener(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    napi_create_int32(env, (OH_Input_RegisterDeviceListener(listener1) == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_UnregisterDeviceListener(listener1);
    delete listener1;
    return result;
}

static napi_value UnregisterDeviceListener(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener1);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListener(listener1) == INPUT_SUCCESS) ? 1 : 0, &result);
    delete listener1;
    return result;
}

static napi_value RegisterDeviceListener2(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener1);

    auto listener2 = new (std::nothrow) Input_DeviceListener();
    if (listener2 == nullptr) {
        return nullptr;
    }
    listener2->deviceAddedCallback = [](int32_t deviceId) {};
    listener2->deviceRemovedCallback = [](int32_t deviceId) {};
    napi_create_int32(env, (OH_Input_RegisterDeviceListener(listener2) == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_UnregisterDeviceListener(listener1);
    OH_Input_UnregisterDeviceListener(listener2);
    delete listener1;
    delete listener2;
    return result;
}

static napi_value UnregisterDeviceListener2(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener1);

    auto listener2 = new (std::nothrow) Input_DeviceListener();
    if (listener2 == nullptr) {
        return nullptr;
    }
    listener2->deviceAddedCallback = [](int32_t deviceId) {};
    listener2->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener2);
    OH_Input_UnregisterDeviceListener(listener1);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListener(listener2) == INPUT_SUCCESS) ? 1 : 0, &result);
    delete listener1;
    delete listener2;
    return result;
}

static napi_value UnregisterDeviceListeners(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto listener1 = new (std::nothrow) Input_DeviceListener();
    if (listener1 == nullptr) {
        return nullptr;
    }
    listener1->deviceAddedCallback = [](int32_t deviceId) {};
    listener1->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener1);

    auto listener2 = new (std::nothrow) Input_DeviceListener();
    if (listener2 == nullptr) {
        return nullptr;
    }
    listener2->deviceAddedCallback = [](int32_t deviceId) {};
    listener2->deviceRemovedCallback = [](int32_t deviceId) {};
    OH_Input_RegisterDeviceListener(listener2);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListeners() == INPUT_SUCCESS) ? 1 : 0, &result);
    delete listener1;
    delete listener2;
    return result;
}

static napi_value RegisterDeviceListener3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener *listener = nullptr;
    napi_create_int32(env, (OH_Input_RegisterDeviceListener(listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_UnregisterDeviceListener(listener);
    return result;
}

static napi_value UnregisterDeviceListener3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener *listener = nullptr;
    OH_Input_RegisterDeviceListener(listener);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListener(listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RegisterDeviceListener4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener listener = {
        nullptr,
        nullptr,
    };
    napi_create_int32(env, (OH_Input_RegisterDeviceListener(&listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_UnregisterDeviceListener(&listener);
    return result;
}

static napi_value UnregisterDeviceListener4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener listener = {
        nullptr,
        nullptr,
    };
    OH_Input_RegisterDeviceListener(&listener);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListener(&listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RegisterDeviceListener5(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener listener = {
        nullptr,
        [](int32_t deviceId) {},
    };
    napi_create_int32(env, (OH_Input_RegisterDeviceListener(&listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_UnregisterDeviceListener(&listener);
    return result;
}

static napi_value UnregisterDeviceListener5(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener listener = {
        nullptr,
        [](int32_t deviceId) {},
    };
    OH_Input_RegisterDeviceListener(&listener);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListener(&listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RegisterDeviceListener6(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener listener = {
        [](int32_t deviceId) {},
        nullptr,
    };
    napi_create_int32(env, (OH_Input_RegisterDeviceListener(&listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_UnregisterDeviceListener(&listener);
    return result;
}

static napi_value UnregisterDeviceListener6(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceListener listener = {
        nullptr,
        [](int32_t deviceId) {},
    };
    OH_Input_RegisterDeviceListener(&listener);
    napi_create_int32(env, (OH_Input_UnregisterDeviceListener(&listener) == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceIds(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceIds2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t *outSize = nullptr;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, outSize);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceIds3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 1;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && outSize == 1) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceIds4(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 0;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = {};
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && outSize == 0) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceIds5(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t *deviceIds = nullptr;
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyboardType(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = -1;
    int32_t KeyboardType = -1;
    Input_Result retResult = OH_Input_GetKeyboardType(deviceId, &KeyboardType);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyboardType2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    int32_t *KeyboardType = nullptr;
    retResult = OH_Input_GetKeyboardType(deviceId, KeyboardType);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyboardType3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);

    int32_t deviceId = outSize;
    int32_t KeyboardType = -1;
    retResult = OH_Input_GetKeyboardType(deviceId, &KeyboardType);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value GetKeyboardType4(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);

    int32_t deviceId = outSize - 1;
    int32_t KeyboardType = -1;
    retResult = OH_Input_GetKeyboardType(deviceId, &KeyboardType);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && KeyboardType >= 0) ? 1 : 0, &result);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Api_Input_GetKeyboardType_0600 KeyboardType:%{public}d", KeyboardType);
    return result;
}

static napi_value GetDevice(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);

    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);
    napi_create_int32(env, retResult == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDevice2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);

    int32_t deviceId = outSize;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDevice3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = -1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    Input_Result retResult = OH_Input_GetDevice(deviceId, &deviceInfo);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDevice4(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    Input_DeviceInfo *deviceInfo = nullptr;
    Input_Result retResult = OH_Input_GetDevice(deviceId, &deviceInfo);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceName(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    char *name = nullptr;
    retResult = OH_Input_GetDeviceName(deviceInfo, &name);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && std::strlen(name) >= 0) ? 1 : 0, &result);
    OH_LOG_INFO(LOG_APP, "outSize:%{public}d", outSize);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceName2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);

    char *name = nullptr;
    Input_Result retResult2 = OH_Input_GetDeviceName(deviceInfo, &name);
    napi_create_int32(env, (retResult1, retResult2 == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceName3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    char **name = nullptr;
    retResult = OH_Input_GetDeviceName(deviceInfo, name);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceName4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();

    char *name = nullptr;
    Input_Result retResult = OH_Input_GetDeviceName(deviceInfo, &name);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && std::strlen(name) == 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceAddress(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    char *address = nullptr;
    retResult = OH_Input_GetDeviceAddress(deviceInfo, &address);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && std::strlen(address) >= 0) ? 1 : 0, &result);
    OH_LOG_INFO(LOG_APP, "outSize:%{public}d", outSize);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceAddress2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);

    char *address = nullptr;
    Input_Result retResult2 = OH_Input_GetDeviceAddress(deviceInfo, &address);
    napi_create_int32(env, (retResult1, retResult2 == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceAddress3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    char **address = nullptr;
    retResult = OH_Input_GetDeviceAddress(deviceInfo, address);
    napi_create_int32(env, retResult == INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceAddress4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    char *address = nullptr;
    Input_Result retResult = OH_Input_GetDeviceAddress(deviceInfo, &address);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && std::strlen(address) == 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceId(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t id = -1;
    retResult = OH_Input_GetDeviceId(deviceInfo, &id);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && (id == outSize - 1)) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceId2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);
    
    int32_t id = -1;
    Input_Result retResult2 = OH_Input_GetDeviceId(deviceInfo, &id);
    napi_create_int32(env, ((retResult1, retResult2 == INPUT_PARAMETER_ERROR) && (id == -1)) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceId3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);
    
    int32_t *id = nullptr;
    retResult = OH_Input_GetDeviceId(deviceInfo, id);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetCapabilities(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t capabilities = -1;
    retResult = OH_Input_GetCapabilities(deviceInfo, &capabilities);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && capabilities >= 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetCapabilities2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t capabilities = -1;
    Input_Result retResult2 = OH_Input_GetCapabilities(deviceInfo, &capabilities);
    napi_create_int32(env, (retResult1, retResult2 == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetCapabilities3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t *capabilities = nullptr;
    retResult = OH_Input_GetCapabilities(deviceInfo, capabilities);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetCapabilities4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    int32_t capabilities = 0;
    Input_Result retResult = OH_Input_GetCapabilities(deviceInfo, &capabilities);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && capabilities < 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceVersion(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t version = -1;
    retResult = OH_Input_GetDeviceVersion(deviceInfo, &version);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && version >= 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceVersion2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t version = -1;
    Input_Result retResult2 = OH_Input_GetDeviceVersion(deviceInfo, &version);
    napi_create_int32(env, (retResult1, retResult2 == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceVersion3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t *version = nullptr;
    retResult = OH_Input_GetDeviceVersion(deviceInfo, version);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceVersion4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    int32_t version = 0;
    Input_Result retResult = OH_Input_GetDeviceVersion(deviceInfo, &version);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && version < 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceProduct(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t product = -1;
    retResult = OH_Input_GetDeviceProduct(deviceInfo, &product);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && product >= 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceProduct2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t product = -1;
    Input_Result retResult2 = OH_Input_GetDeviceProduct(deviceInfo, &product);
    napi_create_int32(env, (retResult1, retResult2 == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceProduct3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t *product = nullptr;
    retResult = OH_Input_GetDeviceProduct(deviceInfo, product);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceProduct4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    int32_t product = 0;
    Input_Result retResult = OH_Input_GetDeviceProduct(deviceInfo, &product);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && product < 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceVendor(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t vendor = -1;
    retResult = OH_Input_GetDeviceVendor(deviceInfo, &vendor);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && vendor >= 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceVendor2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult1 = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = nullptr;
    retResult1 = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t vendor = -1;
    Input_Result retResult2 = OH_Input_GetDeviceVendor(deviceInfo, &vendor);
    napi_create_int32(env, (retResult1, retResult2 == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetDeviceVendor3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int32_t inSize = 64;
    int32_t outSize = 0;
    int32_t deviceIds[inSize] = { 0 };
    Input_Result retResult = OH_Input_GetDeviceIds(deviceIds, inSize, &outSize);
    int32_t deviceId = outSize - 1;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    retResult = OH_Input_GetDevice(deviceId, &deviceInfo);

    int32_t *vendor = nullptr;
    retResult = OH_Input_GetDeviceVendor(deviceInfo, vendor);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value GetDeviceVendor4(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = OH_Input_CreateDeviceInfo();
    int32_t vendor = 0;
    Input_Result retResult = OH_Input_GetDeviceVendor(deviceInfo, &vendor);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && vendor < 0) ? 1 : 0, &result);
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    return result;
}

static napi_value DestroyDeviceInfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_DeviceInfo *deviceInfo = nullptr;
    OH_Input_DestroyDeviceInfo(&deviceInfo);
    napi_create_int32(env, deviceInfo ==  nullptr ? 1 : 0, &result);
    return result;
}

static napi_value GetAllSystemHotkeys(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t count = 1;
    Input_Result ret = OH_Input_GetAllSystemHotkeys(nullptr, &count);
    napi_create_int32(env, ret ==  INPUT_SUCCESS ? 1 : 0, &result);
    return result;
}

static napi_value CreateAllSystemHotkeys(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t count = 1;
    OH_Input_GetAllSystemHotkeys(nullptr, &count);
    Input_Hotkey **hotkey = OH_Input_CreateAllSystemHotkeys(count);
    napi_create_int32(env, hotkey !=  nullptr ? 1 : 0, &result);
    OH_Input_DestroyAllSystemHotkeys(hotkey, count);
    return result;
}

static napi_value GetAllSystemHotkeys2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t count = 1;
    Input_Result ret = OH_Input_GetAllSystemHotkeys(nullptr, &count);
    Input_Hotkey **hotkey = OH_Input_CreateAllSystemHotkeys(count);
    ret = OH_Input_GetAllSystemHotkeys(hotkey, &count);
    napi_create_int32(env, ret == INPUT_SUCCESS ? 1 : 0, &result);
    OH_Input_DestroyAllSystemHotkeys(hotkey, count);
    return result;
}

static napi_value GetAllSystemHotkeys3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Hotkey *hotkey{nullptr};
    Input_Result ret = OH_Input_GetAllSystemHotkeys(&hotkey, nullptr);
    napi_create_int32(env, ret ==  INPUT_PARAMETER_ERROR ? 1 : 0, &result);
    return result;
}

static napi_value CreateAllSystemHotkeys2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t count = 100;
    Input_Hotkey **hotkey = OH_Input_CreateAllSystemHotkeys(count);
    napi_create_int32(env, hotkey ==  nullptr ? 1 : 0, &result);
    OH_Input_DestroyAllSystemHotkeys(hotkey, count);
    return result;
}

static napi_value GetIntervalSinceLastInput(napi_env env, napi_callback_info info)
{
    napi_value result;
    int64_t *intervalSinceLastInput = static_cast<int64_t *>(malloc(sizeof(int64_t)));
    int64_t retResult = OH_Input_GetIntervalSinceLastInput(intervalSinceLastInput);
    free(intervalSinceLastInput);
    napi_create_int32(env, retResult ==  INPUT_SUCCESS ? 1 : 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"CreateKeyState", nullptr, CreateKeyState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyKeyState", nullptr, DestroyKeyState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetKeyCode", nullptr, SetKeyCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetKeyPressed", nullptr, SetKeyPressed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetKeySwitch", nullptr, SetKeySwitch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyPressed", nullptr, GetKeyPressed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeySwitch", nullptr, GetKeySwitch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyState", nullptr, GetKeyState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateKeyEvent", nullptr, CreateKeyEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectKeyEvent", nullptr, InjectKeyEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyKeyEvent", nullptr, DestroyKeyEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventAction", nullptr, GetKeyEventAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventActionDestroy", nullptr, GetKeyEventActionDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventKeyCode", nullptr, GetKeyEventKeyCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventKeyCodeDestroy", nullptr, GetKeyEventKeyCodeDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventActionTime", nullptr, GetKeyEventActionTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventActionTimeDestroy", nullptr, GetKeyEventActionTimeDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createTouchEvent", nullptr, createTouchEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyTouchEvent", nullptr, destroyTouchEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"touchEventAction", nullptr, touchEventAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"touchEventFingerId", nullptr, touchEventFingerId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"touchEventDisplayX", nullptr, touchEventDisplayX, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"touchEventDisplayY", nullptr, touchEventDisplayY, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"touchEventActionTime", nullptr, touchEventActionTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"injectTouchEvent", nullptr, injectTouchEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createMouseEvent", nullptr, createMouseEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyMouseEvent", nullptr, destroyMouseEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventAction", nullptr, mouseEventAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventDisplayX", nullptr, mouseEventDisplayX, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventDisplayY", nullptr, mouseEventDisplayY, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventButton", nullptr, mouseEventButton, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventAxisType", nullptr, mouseEventAxisType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventAxisValue", nullptr, mouseEventAxisValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mouseEventActionTime", nullptr, mouseEventActionTime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"injectMouseEvent", nullptr, injectMouseEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterDeviceListener", nullptr, RegisterDeviceListener, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListener", nullptr, UnregisterDeviceListener, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterDeviceListener2", nullptr, RegisterDeviceListener2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListener2", nullptr, UnregisterDeviceListener2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListeners", nullptr, UnregisterDeviceListeners, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterDeviceListener3", nullptr, RegisterDeviceListener3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListener3", nullptr, UnregisterDeviceListener3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterDeviceListener4", nullptr, RegisterDeviceListener4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListener4", nullptr, UnregisterDeviceListener4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterDeviceListener5", nullptr, RegisterDeviceListener5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListener5", nullptr, UnregisterDeviceListener5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegisterDeviceListener6", nullptr, RegisterDeviceListener6, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnregisterDeviceListener6", nullptr, UnregisterDeviceListener6, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceIds", nullptr, GetDeviceIds, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceIds2", nullptr, GetDeviceIds2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceIds3", nullptr, GetDeviceIds3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceIds4", nullptr, GetDeviceIds4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceIds5", nullptr, GetDeviceIds5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyboardType", nullptr, GetKeyboardType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyboardType2", nullptr, GetKeyboardType2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyboardType3", nullptr, GetKeyboardType3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyboardType4", nullptr, GetKeyboardType4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDevice", nullptr, GetDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDevice2", nullptr, GetDevice2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDevice3", nullptr, GetDevice3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDevice4", nullptr, GetDevice4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceName", nullptr, GetDeviceName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceName2", nullptr, GetDeviceName2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceName3", nullptr, GetDeviceName3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceName4", nullptr, GetDeviceName4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceAddress", nullptr, GetDeviceAddress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceAddress2", nullptr, GetDeviceAddress2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceAddress3", nullptr, GetDeviceAddress3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceAddress4", nullptr, GetDeviceAddress4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceId", nullptr, GetDeviceId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceId2", nullptr, GetDeviceId2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceId3", nullptr, GetDeviceId3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetCapabilities", nullptr, GetCapabilities, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetCapabilities2", nullptr, GetCapabilities2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetCapabilities3", nullptr, GetCapabilities3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetCapabilities4", nullptr, GetCapabilities4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVersion", nullptr, GetDeviceVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVersion2", nullptr, GetDeviceVersion2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVersion3", nullptr, GetDeviceVersion3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVersion4", nullptr, GetDeviceVersion4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceProduct", nullptr, GetDeviceProduct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceProduct2", nullptr, GetDeviceProduct2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceProduct3", nullptr, GetDeviceProduct3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceProduct4", nullptr, GetDeviceProduct4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVendor", nullptr, GetDeviceVendor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVendor2", nullptr, GetDeviceVendor2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVendor3", nullptr, GetDeviceVendor3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDeviceVendor4", nullptr, GetDeviceVendor4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DestroyDeviceInfo", nullptr, DestroyDeviceInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAllSystemHotkeys", nullptr, GetAllSystemHotkeys, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateAllSystemHotkeys", nullptr, CreateAllSystemHotkeys, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAllSystemHotkeys2", nullptr, GetAllSystemHotkeys2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetAllSystemHotkeys3", nullptr, GetAllSystemHotkeys3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreateAllSystemHotkeys2", nullptr, CreateAllSystemHotkeys2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetIntervalSinceLastInput", nullptr,
         GetIntervalSinceLastInput, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libinputndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}