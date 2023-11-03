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

#include "include/c_api/context_c.h"
#include "include/c_api/data_type_c.h"
#include "include/c_api/model_c.h"
#include "include/c_api/status_c.h"
#include "napi/native_api.h"
#include "native_common.h"
#include <js_native_api_types.h>


static napi_value OHAIContextCreate001(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();

    napi_value result = nullptr;
    napi_create_int32(env, oH_AI_ContextHandle != nullptr, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextDestroy001(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();

    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    napi_create_int32(env, oH_AI_ContextHandle == nullptr, &result);

    return result;
}

static napi_value OHAIContextSetThreadNum001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, value0);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadNum002(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, value0);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadNum001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, value0);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadNum002(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;
    int32_t oH_AI_ContextGetThreadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, oH_AI_ContextGetThreadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityMode001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value0);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityMode002(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value0);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityMode003(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value0);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityMode004(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value0);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityMode005(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value0);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityMode001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value0;
    napi_get_value_int32(env, args[0], &value0);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value0);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityMode002(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;

    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIDeviceInfoCreate001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    napi_value result = nullptr;

    if (value0 == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        napi_create_int32(env, oH_AI_DeviceInfoHandle != nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceType001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    napi_value result = nullptr;

    if (value0 == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_CPU, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHAIContextCreate001", nullptr, OHAIContextCreate001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextDestroy001", nullptr, OHAIContextDestroy001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextSetThreadNum001", nullptr, OHAIContextSetThreadNum001, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextSetThreadNum002", nullptr, OHAIContextSetThreadNum002, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextGetThreadNum001", nullptr, OHAIContextGetThreadNum001, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextGetThreadNum002", nullptr, OHAIContextGetThreadNum002, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextSetThreadAffinityMode001", nullptr, OHAIContextSetThreadAffinityMode001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityMode002", nullptr, OHAIContextSetThreadAffinityMode002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityMode003", nullptr, OHAIContextSetThreadAffinityMode003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityMode004", nullptr, OHAIContextSetThreadAffinityMode004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityMode005", nullptr, OHAIContextSetThreadAffinityMode005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetThreadAffinityMode001", nullptr, OHAIContextGetThreadAffinityMode001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetThreadAffinityMode002", nullptr, OHAIContextGetThreadAffinityMode002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoCreate001", nullptr, OHAIDeviceInfoCreate001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceType001", nullptr, OHAIDeviceInfoGetDeviceType001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "libmindspore",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
