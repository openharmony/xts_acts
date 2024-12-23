/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <fcntl.h>
#include <js_native_api_types.h>
#include <sys/swap.h>
#include <unistd.h>
#include <hilog/log.h>

#define INIT (-1)
#define FAIL (-1)
#define SUCCESS 0
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_0777 0777

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFEFE
#define LOG_TAG "MUSL_LIBCTEST"

static napi_value SwapOn(napi_env env, napi_callback_info info)
{
    int flags = SWAP_FLAG_PREFER, backParam = PARAM_1;
    napi_value result = nullptr;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    errno = 0;
    int fd = open(path, O_CREAT, PARAM_0777);
    if (fd == FAIL) {
        OH_LOG_INFO(LOG_APP, "SwapOn open failed: fd %{public}d errno : %{public}d", fd, errno);
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    // Test syscall encapsulation interface
    backParam = swapon(path, flags);
    close(fd);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value SwapOff(napi_env env, napi_callback_info info)
{
    int flags = SWAP_FLAG_PREFER, checkParam, backParam = PARAM_1;
    napi_value result = nullptr;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    errno = 0;
    int fd = open(path, O_CREAT, PARAM_0777);
    if (fd == FAIL) {
        OH_LOG_INFO(LOG_APP, "SwapOff open failed: fd %{public}d errno : %{public}d", fd, errno);
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    // Test syscall encapsulation interface
    checkParam = swapon(path, flags);
    if (checkParam != MPARAM_1) {
        backParam = swapoff(path);
    }
    close(fd);
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"swapon", nullptr, SwapOn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"swapoff", nullptr, SwapOff, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libswapndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
