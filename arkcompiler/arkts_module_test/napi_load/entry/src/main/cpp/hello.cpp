/**
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
#include <string>

constexpr int32_t CHAR_SIZE = 50;

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t requireArgc = 2;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value loadModuleWithInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return nullptr;
    }

    napi_value path_c = args[1];
    napi_value name_c = args[0];
    char name[CHAR_SIZE] = {0};
    size_t len = 0;
    napi_get_value_string_utf8(env, name_c, name, CHAR_SIZE, &len);
    char path[CHAR_SIZE] = {0};
    size_t pathLen = 0;
    napi_get_value_string_utf8(env, path_c, path, CHAR_SIZE, &pathLen);

    napi_value result;
    if (pathLen == 0) {
        status = napi_load_module_with_info(env, name, nullptr, &result);
    } else {
        status = napi_load_module_with_info(env, name, path, &result);
    }

    if (status != napi_ok) {
        return nullptr;
    }

    return result;
}

static napi_value loadModuleOHPMCrypto(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_value result;
    napi_status status;

    status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_throw_error(env, nullptr, "Expected one argument");
        return nullptr;
    }

    status = napi_load_module_with_info(env, "@ohos/crypto-js", "com.acts.arktsnapiloadtest/entry_test", &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to load @ohos/crypto-js module");
        return nullptr;
    }

    napi_value cryptoJS;
    status = napi_get_named_property(env, result, "CryptoJS", &cryptoJS);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get CryptoJS property");
        return nullptr;
    }

    napi_value md5Fn;
    status = napi_get_named_property(env, cryptoJS, "MD5", &md5Fn);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get MD5 method");
        return nullptr;
    }

    napi_value hashResult;
    status = napi_call_function(env, cryptoJS, md5Fn, 1, args, &hashResult);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to call MD5 function");
        return nullptr;
    }

    return hashResult;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "loadModuleWithInfo", nullptr, loadModuleWithInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "loadModuleOHPMCrypto", nullptr, loadModuleOHPMCrypto, nullptr, nullptr, nullptr, napi_default, nullptr }
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
