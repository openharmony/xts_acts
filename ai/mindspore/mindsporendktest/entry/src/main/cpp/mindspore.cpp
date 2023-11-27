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
#include "include/c_api/types_c.h"
#include "napi/native_api.h"
#include "native_common.h"
#include <errno.h>
#include <js_native_api_types.h>
#include <stdlib.h>

static napi_value OHAIContextCreateOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();

    napi_value result = nullptr;
    napi_create_int32(env, oH_AI_ContextHandle != nullptr, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextDestroyOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();

    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    napi_create_int32(env, oH_AI_ContextHandle == nullptr, &result);

    return result;
}

static napi_value OHAIContextSetThreadNumOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, value_one);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadNumTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, value_one);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadNumOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, value_one);
    int32_t getThreadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, getThreadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadNumTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;
    int32_t oH_AI_ContextGetThreadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, oH_AI_ContextGetThreadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value_one);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityModeTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value_one);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, value_one);
    int threadAffinityModeResult = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityModeResult, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityModeTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;

    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIDeviceInfoCreateOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_ContextHandle Create Error");
        napi_create_int32(env, oH_AI_DeviceInfoHandle != nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
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

static napi_value OHAIDeviceInfoGetDeviceTypeTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_NNRT, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeThree(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_INVALID) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle == nullptr, "Create oH_AI_DeviceInfoHandle != nullptr");
        OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_INVALID, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeFour(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_INVALID, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIDeviceInfoDestroyOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
        napi_create_int32(env, oH_AI_DeviceInfoHandle == nullptr, &result);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetProviderOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);

        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);

        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderThree(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_INVALID) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle == nullptr, "Create oH_AI_DeviceInfoHandle != nullptr");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, providerResult == nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderFour(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, value_two);
    const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, providerResult == nullptr, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, providerResult == nullptr, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderDeviceOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderDeviceTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderDeviceThree(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_INVALID) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle == nullptr, "Create oH_AI_DeviceInfoHandle != nullptr");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, providerResult == nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderDeviceOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[1], value_two, length, &stResult);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, value_two);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(value_two);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderDeviceTwo(napi_env env, napi_callback_info)
{

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, providerResult == nullptr, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIDeviceInfoSetEnableFP16One(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, true);
        bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, fP16Result == true, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }

    return result;
}

static napi_value OHAIDeviceInfoSetEnableFP16Two(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, false);
        bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, fP16Result == false, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }

    return result;
}

static napi_value OHAIDeviceInfoSetEnableFP16Three(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, true);
    bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, fP16Result == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoGetEnableFP16One(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, false);
        bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, fP16Result == false, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }

    return result;
}

static napi_value OHAIDeviceInfoGetEnableFP16Two(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, fP16Result == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoSetDeviceIdOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetDeviceId(oH_AI_DeviceInfoHandle, value_two);
        size_t deviceId = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceId, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetDeviceIdTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    size_t deviceId = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, deviceId == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoGetDeviceIdOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if (value_one == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetDeviceId(oH_AI_DeviceInfoHandle, value_two);
        size_t deviceIdResult = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceIdResult, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceIdTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    size_t deviceId = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, deviceId == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if ((value_one == OH_AI_DEVICETYPE_NNRT) && (value_two == OH_AI_PERFORMANCE_NONE)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_NONE);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if ((value_one == OH_AI_DEVICETYPE_NNRT) && (value_two == OH_AI_PERFORMANCE_LOW)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_LOW);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeThree(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if ((value_one == OH_AI_DEVICETYPE_NNRT) && (value_two == OH_AI_PERFORMANCE_MEDIUM)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_MEDIUM);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeFour(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if ((value_one == OH_AI_DEVICETYPE_NNRT) && (value_two == OH_AI_PERFORMANCE_HIGH)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_HIGH);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeFive(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if ((value_one == OH_AI_DEVICETYPE_NNRT) && (value_two == OH_AI_PERFORMANCE_EXTREME)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_EXTREME);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetPerformanceModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);
    int value_two;
    napi_get_value_int32(env, args[1], &value_two);

    napi_value result = nullptr;

    if ((value_one == OH_AI_DEVICETYPE_NNRT) && (value_two == OH_AI_PERFORMANCE_NONE)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_NONE);
        OH_AI_PerformanceMode performanceModeResult = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceModeResult, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetPerformanceModeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, performanceMode, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityCoreListOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    constexpr size_t core_num = 3;
    const int32_t core_list[core_num] = {0, 1, 2};
    OH_AI_ContextSetThreadAffinityCoreList(oH_AI_ContextHandle, core_list, core_num);
    size_t ret_core_num;
    const int32_t *threadAffinityCoreList = OH_AI_ContextGetThreadAffinityCoreList(oH_AI_ContextHandle, &ret_core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        NAPI_ASSERT(env, threadAffinityCoreList[i] == core_list[i], "threadAffinityCoreList is error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityCoreListOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    constexpr size_t core_num = 5;
    const int32_t core_list[core_num] = {1, 2, 3, 4, 5};
    OH_AI_ContextSetThreadAffinityCoreList(oH_AI_ContextHandle, core_list, core_num);
    size_t ret_core_num;
    const int32_t *threadAffinityCoreList = OH_AI_ContextGetThreadAffinityCoreList(oH_AI_ContextHandle, &ret_core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        NAPI_ASSERT(env, threadAffinityCoreList[i] == core_list[i], "threadAffinityCoreList is error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetEnableParallelOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetEnableParallel(oH_AI_ContextHandle, true);
    bool parallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, parallelResult == true, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetEnableParallelTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetEnableParallel(oH_AI_ContextHandle, false);
    bool parallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, parallelResult == false, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetEnableParallelOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetEnableParallel(oH_AI_ContextHandle, true);
    bool getParallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, getParallelResult == true, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetEnableParallelTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;
    bool getParallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, getParallelResult == 0, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAISetFrequencyOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    OH_AI_DeviceInfoSetFrequency(oH_AI_DeviceInfoHandle, value_one);
    int frequency = OH_AI_DeviceInfoGetFrequency(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, frequency, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIGetFrequencyOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value_one;
    napi_get_value_int32(env, args[0], &value_one);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    OH_AI_DeviceInfoSetFrequency(oH_AI_DeviceInfoHandle, value_one);
    int frequency = OH_AI_DeviceInfoGetFrequency(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, frequency, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIModelCreateOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    napi_create_int32(env, model != nullptr, &result);
    OH_AI_ModelDestroy(&model);
    return result;
}

static napi_value OHAIModelDestroyOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();

    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextDestroy(&model);
    napi_create_int32(env, model == nullptr, &result);

    return result;
}

static napi_value OHAITensorCreateOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    napi_create_int32(env, tensor != nullptr, &result);
    return result;
}

static napi_value OHAITensorDestroyOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorDestroy(&tensor);
    napi_create_int32(env, tensor == nullptr, &result);
    return result;
}

static napi_value OHAITensorCloneOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    size_t len = 1 * 48 * 48 * 3 * sizeof(float);
    int32_t value_one[len];
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                                   create_shape_num, (void *)value_one, len);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    napi_create_int32(env, clone != nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetNameOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64, stResult = 0;
    char *value_two = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], value_two, length, &stResult);
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetName(tensor, value_two);
    const char *tensor_name = OH_AI_TensorGetName(tensor);
    napi_create_string_utf8(env, tensor_name, NAPI_AUTO_LENGTH, &result);
    OH_AI_TensorDestroy(&tensor);
    free(value_two);
    return result;
}

static napi_value OHAITensorGetNameOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64, stResult = 0;
    char *getValue = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], getValue, length, &stResult);
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetName(tensor, getValue);
    const char *get_tensor_name = OH_AI_TensorGetName(tensor);
    napi_create_string_utf8(env, get_tensor_name, NAPI_AUTO_LENGTH, &result);
    OH_AI_TensorDestroy(&tensor);
    free(getValue);
    return result;
}

static napi_value OHAITensorSetDataTypeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_DataType data_type = OH_AI_TensorGetDataType(tensor);
    napi_create_int32(env, data_type == OH_AI_DATATYPE_NUMBERTYPE_FLOAT16, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataTypeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT64);
    OH_AI_DataType get_data_type = OH_AI_TensorGetDataType(tensor);
    napi_create_int32(env, get_data_type == OH_AI_DATATYPE_NUMBERTYPE_FLOAT64, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetShapeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t new_shape_num = 4;
    int64_t new_shape[new_shape_num] = {1, 32, 32, 1};
    OH_AI_TensorSetShape(tensor, new_shape, new_shape_num);
    size_t new_ret_shape_num;
    const int64_t *new_ret_shape = OH_AI_TensorGetShape(tensor, &new_ret_shape_num);
    for (size_t i = 0; i < new_ret_shape_num; i++) {
        NAPI_ASSERT(env, new_ret_shape[i] == new_shape[i], "tensor shape compare error");
    }
    napi_create_int32(env, new_ret_shape_num == new_shape_num, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetShapeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t new_shape_num = 6;
    int64_t new_shape[new_shape_num] = {16, 32, 64, 64, 32, 16};
    OH_AI_TensorSetShape(tensor, new_shape, new_shape_num);
    size_t new_ret_shape_num;
    const int64_t *new_ret_shape = OH_AI_TensorGetShape(tensor, &new_ret_shape_num);
    for (size_t i = 0; i < new_ret_shape_num; i++) {
        NAPI_ASSERT(env, new_ret_shape[i] == new_shape[i], "tensor shape compare error");
    }
    napi_create_int32(env, new_ret_shape_num == new_shape_num, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetFormatOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC);
    OH_AI_Format data_format = OH_AI_TensorGetFormat(tensor);
    napi_create_int32(env, data_format == OH_AI_FORMAT_NHWC, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetFormatOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_HWKC);
    OH_AI_Format get_data_format = OH_AI_TensorGetFormat(tensor);
    napi_create_int32(env, get_data_format == OH_AI_FORMAT_HWKC, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorSetData(tensor, data);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    for (size_t i = 0; i < data_len; i++) {
        NAPI_ASSERT(env, ret_data[i] == data[i], "tensor data Error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t data_len = 4;
    float data[data_len] = {1, 2, 3, 4};
    OH_AI_TensorSetData(tensor, data);
    const float *get_ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    for (size_t i = 0; i < data_len; i++) {
        NAPI_ASSERT(env, get_ret_data[i] == data[i], "tensor data Error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetMutableDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
    napi_create_int32(env, input_data != nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetElementNumOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    int64_t element_num = OH_AI_TensorGetElementNum(tensor);
    napi_create_int32(env, element_num != 0, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataSizeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    size_t data_size = OH_AI_TensorGetDataSize(tensor);
    napi_create_int32(env, data_size != 0, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAIDeviceInfoSetPriorityOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    NAPI_ASSERT(env, nnrt_device_info != nullptr, "nnrt_device_info Create Error");
    errno = 0;
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    napi_create_int32(env, errno == 0, &result);
    OH_AI_DeviceInfoDestroy(&nnrt_device_info);
    return result;
}

static napi_value OHAIDeviceInfoAddExtensionOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    const char *cache_path = "/data/local/tmp/";
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    errno = 0;
    size_t size_value = sizeof(*cache_path);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, size_value);
    napi_create_int32(env, errno == 0, &result);
    return result;
}

static napi_value OHAIContextAddDeviceInfoOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle npu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    NAPI_ASSERT(env, npu_device_info != nullptr, "npu_device_info Create Error");
    errno = 0;
    OH_AI_ContextAddDeviceInfo(context, npu_device_info);
    napi_create_int32(env, errno == 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHAIContextCreateOne", nullptr, OHAIContextCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextDestroyOne", nullptr, OHAIContextDestroyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextSetThreadNumOne", nullptr, OHAIContextSetThreadNumOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextSetThreadNumTwo", nullptr, OHAIContextSetThreadNumTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextGetThreadNumOne", nullptr, OHAIContextGetThreadNumOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextGetThreadNumTwo", nullptr, OHAIContextGetThreadNumTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextSetThreadAffinityModeOne", nullptr, OHAIContextSetThreadAffinityModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityModeTwo", nullptr, OHAIContextSetThreadAffinityModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetThreadAffinityModeOne", nullptr, OHAIContextGetThreadAffinityModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetThreadAffinityModeTwo", nullptr, OHAIContextGetThreadAffinityModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoCreateOne", nullptr, OHAIDeviceInfoCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeOne", nullptr, OHAIDeviceInfoGetDeviceTypeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeTwo", nullptr, OHAIDeviceInfoGetDeviceTypeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeThree", nullptr, OHAIDeviceInfoGetDeviceTypeThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeFour", nullptr, OHAIDeviceInfoGetDeviceTypeFour, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoDestroyOne", nullptr, OHAIDeviceInfoDestroyOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderOne", nullptr, OHAIDeviceInfoSetProviderOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderTwo", nullptr, OHAIDeviceInfoSetProviderTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderThree", nullptr, OHAIDeviceInfoSetProviderThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetProviderFour", nullptr, OHAIDeviceInfoSetProviderFour, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetProviderOne", nullptr, OHAIDeviceInfoGetProviderOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoGetProviderTwo", nullptr, OHAIDeviceInfoGetProviderTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderDeviceOne", nullptr, OHAIDeviceInfoSetProviderDeviceOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetProviderDeviceTwo", nullptr, OHAIDeviceInfoSetProviderDeviceTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetProviderDeviceThree", nullptr, OHAIDeviceInfoSetProviderDeviceThree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetProviderDeviceOne", nullptr, OHAIDeviceInfoGetProviderDeviceOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetProviderDeviceTwo", nullptr, OHAIDeviceInfoGetProviderDeviceTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetEnableFP16One", nullptr, OHAIDeviceInfoSetEnableFP16One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetEnableFP16Two", nullptr, OHAIDeviceInfoSetEnableFP16Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetEnableFP16Three", nullptr, OHAIDeviceInfoSetEnableFP16Three, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetEnableFP16One", nullptr, OHAIDeviceInfoGetEnableFP16One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetEnableFP16Two", nullptr, OHAIDeviceInfoGetEnableFP16Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetDeviceIdOne", nullptr, OHAIDeviceInfoSetDeviceIdOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetDeviceIdTwo", nullptr, OHAIDeviceInfoSetDeviceIdTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoGetDeviceIdOne", nullptr, OHAIDeviceInfoGetDeviceIdOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoGetDeviceIdTwo", nullptr, OHAIDeviceInfoGetDeviceIdTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetPerformanceModeOne", nullptr, OHAIDeviceInfoSetPerformanceModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeTwo", nullptr, OHAIDeviceInfoSetPerformanceModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeThree", nullptr, OHAIDeviceInfoSetPerformanceModeThree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeFour", nullptr, OHAIDeviceInfoSetPerformanceModeFour, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeFive", nullptr, OHAIDeviceInfoSetPerformanceModeFive, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetPerformanceModeOne", nullptr, OHAIDeviceInfoGetPerformanceModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetPerformanceModeTwo", nullptr, OHAIDeviceInfoGetPerformanceModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityCoreListOne", nullptr, OHAIContextSetThreadAffinityCoreListOne, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIContextGetThreadAffinityCoreListOne", nullptr, OHAIContextGetThreadAffinityCoreListOne, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIContextSetEnableParallelOne", nullptr, OHAIContextSetEnableParallelOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetEnableParallelTwo", nullptr, OHAIContextSetEnableParallelTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetEnableParallelOne", nullptr, OHAIContextGetEnableParallelOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetEnableParallelTwo", nullptr, OHAIContextGetEnableParallelTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAISetFrequencyOne", nullptr, OHAISetFrequencyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIGetFrequencyOne", nullptr, OHAIGetFrequencyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelCreateOne", nullptr, OHAIModelCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelDestroyOne", nullptr, OHAIModelDestroyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorCreateOne", nullptr, OHAITensorCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorDestroyOne", nullptr, OHAITensorDestroyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorCloneOne", nullptr, OHAITensorCloneOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetNameOne", nullptr, OHAITensorSetNameOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetNameOne", nullptr, OHAITensorGetNameOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetDataTypeOne", nullptr, OHAITensorSetDataTypeOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetDataTypeOne", nullptr, OHAITensorGetDataTypeOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorSetShapeOne", nullptr, OHAITensorSetShapeOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetShapeOne", nullptr, OHAITensorGetShapeOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetFormatOne", nullptr, OHAITensorSetFormatOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetFormatOne", nullptr, OHAITensorGetFormatOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetDataOne", nullptr, OHAITensorSetDataOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetDataOne", nullptr, OHAITensorGetDataOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetMutableDataOne", nullptr, OHAITensorGetMutableDataOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetElementNumOne", nullptr, OHAITensorGetElementNumOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetDataSizeOne", nullptr, OHAITensorGetDataSizeOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetPriorityOne", nullptr, OHAIDeviceInfoSetPriorityOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoAddExtensionOne", nullptr, OHAIDeviceInfoAddExtensionOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextAddDeviceInfoOne", nullptr, OHAIContextAddDeviceInfoOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
