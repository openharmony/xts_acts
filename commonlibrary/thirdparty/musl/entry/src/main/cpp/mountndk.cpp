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

#include "napi/native_api.h"
#include <cerrno>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <sys/mman.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string>
#include "common/napi_helper.cpp"

#define NO_ERR 0
#define SUCCESS 1
#define FAIL -1
#define PARAM_0 0
#define TEN 10
#define STATERROR -100
#define OPENERROR -99
#define MMAPERROR -98
#define TEST_SIZE 4096
#define ERRON_0 0
static napi_value Mount(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int rev = FAIL;
    int retVal = FAIL;
    const char special[] = "/mymount";
    const char target[] = "/tmp";
    rev = mount(special, target, "", PARAM_0, "");
    retVal = rev;
    if (rev == PARAM_0) {
        rev = umount(special);
    }
    napi_value result = nullptr;
    napi_create_int32(env, retVal, &result);
    return result;
}
static napi_value Umount(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    const char special[] = "/mymount";
    const char target[] = "/tmp";
    int umountResult = FAIL;
    if(strcmp(valueFirst.data(), special) == PARAM_0){
        mount(special, target, "", PARAM_0, "");
        umountResult = umount(special);
    }
    napi_value result = nullptr;
    napi_create_int32(env, umountResult, &result);
    return result;
}
static napi_value Umount2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    const char special[] = "/mymount";
    const char target[] = "/tmp";
    int umountResult = FAIL;
    if(strcmp(valueFirst.data(), special) == PARAM_0){
        mount(special, target, "", PARAM_0, "");
        umountResult = umount2(special,MNT_DETACH);
    }
    napi_value result = nullptr;
    napi_create_int32(env, umountResult, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"mount", nullptr, Mount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umount", nullptr, Umount, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umount2", nullptr, Umount2, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "mman",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
