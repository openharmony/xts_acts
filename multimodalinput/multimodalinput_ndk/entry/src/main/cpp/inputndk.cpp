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
#include "oh_input_manager.h"
#include "oh_key_code.h"

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
    struct Input_TouchEvent *touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventAction(touchEvent, TOUCH_ACTION_DOWN);
    OH_Input_SetTouchEventFingerId(touchEvent, 0);
    OH_Input_SetTouchEventDisplayX(touchEvent, 671);
    OH_Input_SetTouchEventDisplayY(touchEvent, -10);
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
    struct Input_MouseEvent *mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventAction(mouseEvent, MOUSE_ACTION_MOVE);
    OH_Input_SetMouseEventDisplayX(mouseEvent, 350);
    OH_Input_SetMouseEventDisplayY(mouseEvent, 350);
    OH_Input_SetMouseEventButton(mouseEvent, -2);
    OH_Input_SetMouseEventActionTime(mouseEvent, -1);
    napi_value result;
    napi_create_int32(env, OH_Input_InjectMouseEvent(mouseEvent), &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
