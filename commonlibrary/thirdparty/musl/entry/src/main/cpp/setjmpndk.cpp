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

#include <csetjmp>
#include <js_native_api.h>
#include <node_api.h>
#define ZERO 0
static napi_value Setjmp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    jmp_buf jmp;
    if (valueFirst == ZERO) {
        int setValue = setjmp(jmp);
        napi_value result;
        napi_create_int32(env, setValue, &result);
        return result;
    } else {
        int setValue = setjmp(jmp);
        if (setValue == ZERO) {
            longjmp(jmp, valueSecond);
        }
        napi_value result;
        napi_create_int32(env, setValue, &result);
        return result;
    }
}

static napi_value Sigsetjmp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigjmp_buf jmp;
    if (valueFirst == ZERO) {
        int sigValue = sigsetjmp(jmp, ZERO);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sigsetjmp(jmp, ZERO);
        if (sigValue == ZERO) {
            siglongjmp(jmp, valueSecond);
        }
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Siglongjmp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    sigjmp_buf bufJmp;
    int jmpValue = sigsetjmp(bufJmp, ZERO);
    if (jmpValue == ZERO) {
        siglongjmp(bufJmp, valueFirst);
    }
    napi_value result;
    napi_create_int32(env, jmpValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setjmp", nullptr, Setjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigsetjmp", nullptr, Sigsetjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"siglongjmp", nullptr, Siglongjmp, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "setjmp",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
