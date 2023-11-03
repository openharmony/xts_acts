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
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <clocale>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <js_native_api.h>
#include <node_api.h>
#define FAIL -1
#define NO_ERR 0
#define TWO 2
#define ZERO 0

static napi_value Strerror_l(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *error_value;
    locale_t locale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    if (valueFirst == FAIL) {
        error_value = strerror_l(valueFirst, locale);
    } else if (valueFirst == TWO) {
        int valueSecond = rand();
        error_value = strerror_l(valueSecond, locale);
    } else {
        FILE *file = fopen("non_existent_file.txt", "r");
        if (file == nullptr) {
            error_value = strerror_l(errno, locale);
        }
    }
    napi_value result = nullptr;
    napi_create_string_utf8(env, error_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strdup(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *char_value;
    char_value = strdup(valueFirst);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcat(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *char_value;
    char_value = strcat(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strchr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char valueSecond = '9';
    char *char_value;
    char_value = strchr(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcmp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int sin_value = strcmp(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strcoll(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int sin_value = strcoll(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strcoll_l(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    locale_t locale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    int sin_value = strcoll_l(valueFirst, valueSecond, locale);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strlen(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int sin_value = strlen(valueFirst);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strncat(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird = napi_get_value_int32(env, args[2], &valueThird);
    char *value3 = strncat(valueFirst, valueSecond, valueThird);
    napi_value result = nullptr;
    napi_create_string_utf8(env, value3, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Strncmp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[0], &valueThird);
    int strNCmpValue = strncmp(valueFirst, valueSecond, valueThird);

    napi_value result = nullptr;
    napi_create_int32(env, strNCmpValue, &result);
    return result;
}

static napi_value Strncpy(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[2], &valueThird);
    char *strNCpyValue = strncpy(valueFirst, valueSecond, valueThird);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strNCpyValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strndup(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    char *strNdUpValue = strndup(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strNdUpValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strnlen(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    int strNLenValue = strnlen(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, strNLenValue, &result);

    return result;
}

static napi_value Strpbrk(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strPBrkValue = strpbrk(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strPBrkValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strrchr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);

    char *strRChr_value;
    if (valueFirst == ZERO) {
        char src[20] = "aa/bb/cc";
        strRChr_value = strrchr(src, valueSecond);
    } else {
        char src[20] = "aa/bb/cc";
        strRChr_value = strrchr(src, valueSecond);
    }

    napi_value result = nullptr;
    napi_create_string_utf8(env, strRChr_value, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strsep(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strSepValue = strsep(&valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strSepValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strspn(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int strSpnValue = strspn(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, strSpnValue, &result);

    return result;
}

static napi_value Strstr(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strStrValue = strstr(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strStrValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strtok(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strTokValue = strtok(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strTokValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value StrtokR(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *valueThird = NapiHelper::GetString(env, args[2]);
    char *strTokValue = strtok_r(valueFirst, valueSecond, &valueThird);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strTokValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strxfrm(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[2], &valueThird);
    int strTxFrmValue;
    if (valueFirst == ZERO) {
        char value[10];
        strTxFrmValue = strxfrm(value, valueSecond, valueThird);
    } else {
        char value[30];
        strTxFrmValue = strxfrm(value, valueSecond, valueThird);
    }

    napi_value result = nullptr;
    napi_create_int32(env, strTxFrmValue, &result);

    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"strerror_l", nullptr, Strerror_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strchr", nullptr, Strchr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strdup", nullptr, Strdup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcat", nullptr, Strcat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcmp", nullptr, Strcmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcoll", nullptr, Strcoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcoll_l", nullptr, Strcoll_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strlen", nullptr, Strlen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncat", nullptr, Strncat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncmp", nullptr, Strncmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncpy", nullptr, Strncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strndup", nullptr, Strndup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strnlen", nullptr, Strnlen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strpbrk", nullptr, Strpbrk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strrchr", nullptr, Strrchr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strsep", nullptr, Strsep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strspn", nullptr, Strspn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strstr", nullptr, Strstr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtok", nullptr, Strtok, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtokR", nullptr, StrtokR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strxfrm", nullptr, Strxfrm, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "string",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
