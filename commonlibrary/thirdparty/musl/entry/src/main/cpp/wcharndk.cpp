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
#include <cstdlib>
#include <cwchar>
#include <js_native_api.h>
#include <node_api.h>
#define FAIL -1
#define NORMAL 1
#define ZERO 0

static napi_value Wcpcpy(napi_env env, napi_callback_info info)
{
    wchar_t deSt[20];
    wchar_t src[] = L"123456";
    wcpcpy(deSt, src);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcscat(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"1234";
    wchar_t src[50] = L"5678";
    wcscat(deSt, src);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcschr(napi_env env, napi_callback_info info)
{
    wchar_t deSt[] = L"1234";
    wchar_t src = L'5';
    int value = FAIL;
    if (wcschr(deSt, src) == nullptr) {
        value = ZERO;
    }

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcscmp(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"12345";
    wchar_t src[50] = L"12345";
    int wcscmp_value = wcscmp(deSt, src);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp_value, &result);

    return result;
}

static napi_value Wcscoll(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"12345";
    wchar_t src[50] = L"12345";
    int wcscmp_value = wcscoll(deSt, src);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp_value, &result);

    return result;
}

static napi_value Wcscpy(napi_env env, napi_callback_info info)
{
    wchar_t deSt[20];
    wchar_t src[] = L"123456";
    wcscpy(deSt, src);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcscspn(napi_env env, napi_callback_info info)
{
    wchar_t deSt[9] = L"12345";
    wchar_t src[] = L"52678";
    size_t value = wcscspn(deSt, src);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsdup(napi_env env, napi_callback_info info)
{
    wchar_t deSt[] = L"12345";
    int value = FAIL;
    if (wcsdup(deSt) != nullptr) {
        value = ZERO;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcslen(napi_env env, napi_callback_info info)
{
    wchar_t src[] = L"abcd";
    int value = wcslen(src);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsncat(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"123";
    wchar_t src[] = L"456";
    wcsncat(deSt, src, NORMAL);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsncmp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    wchar_t deSt[50] = L"1232";
    wchar_t src[50] = L"1231";
    int wcsncmp_value = wcsncmp(deSt, src, valueFirst);
    napi_value result = nullptr;
    napi_create_int32(env, wcsncmp_value, &result);

    return result;
}

static napi_value Wcsncpy(napi_env env, napi_callback_info info)
{
    wchar_t deSt[20];
    wchar_t src[] = L"778899";
    wcsncpy(deSt, src, 4);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsnlen(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    wchar_t src[] = L"abcde";
    int value = wcsnlen(src, valueFirst);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcspbrk(napi_env env, napi_callback_info info)
{
    wchar_t deSt[] = L"abcd";
    wchar_t src[] = L"a";
    wchar_t *wcspbrk_value = wcspbrk(deSt, src);
    int value = FAIL;
    if (wcspbrk_value != nullptr) {
        value = ZERO;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"wcpcpy", nullptr, Wcpcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscat", nullptr, Wcscat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcschr", nullptr, Wcschr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscmp", nullptr, Wcscmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscoll", nullptr, Wcscoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscpy", nullptr, Wcscpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscspn", nullptr, Wcscspn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcslen", nullptr, Wcslen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncat", nullptr, Wcsncat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsdup", nullptr, Wcsdup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncmp", nullptr, Wcsncmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncpy", nullptr, Wcsncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsnlen", nullptr, Wcsnlen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcspbrk", nullptr, Wcspbrk, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "wchar",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
