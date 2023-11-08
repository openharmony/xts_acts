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

#include "common/napi_helper.cpp"
#include "napi/native_api.h"
#include <cerrno>
#include <clocale>
#include <cstdlib>
#include <cstring>
#include <strings.h>
#include <sys/procfs.h>
#define ZERO 0

static napi_value Strcasecmp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int sin_value = strcasecmp(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strcasecmp_l(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    locale_t locale = nullptr;
    int sin_value = strcasecmp_l(valueFirst, valueSecond, locale);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strncasecmp(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[2], &valueThird);
    int sin_value = strncasecmp(valueFirst, valueSecond, valueThird);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strncasecmp_l(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[2], &valueThird);
    int value4;
    napi_get_value_int32(env, args[3], &value4);
    int sin_value;
    if (value4 == ZERO) {
        locale_t locale = newlocale(LC_ALL_MASK, "en_US", nullptr);
        sin_value = strncasecmp_l(valueFirst, valueSecond, valueThird, locale);
    } else {
        sin_value = strncasecmp_l(valueFirst, valueSecond, valueThird, nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Stpcpy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[4];
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    stpcpy(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, valueFirst, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcpy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[4];
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    strcpy(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, valueFirst, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcspn(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int int_value;
    int_value = strcspn(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, int_value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"strcasecmp", nullptr, Strcasecmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcasecmp_l", nullptr, Strcasecmp_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncasecmp", nullptr, Strncasecmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncasecmp_l", nullptr, Strncasecmp_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stpcpy", nullptr, Stpcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcpy", nullptr, Strcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcspn", nullptr, Strcspn, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "strings",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
