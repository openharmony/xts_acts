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

#include <cerrno>
#include <cstdlib>
#include <dirent.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <limits.h>
#include <node_api.h>

#define FAIL -1
#define FALSE 0
#define ERROR -1
#define FIVE 5
#define ONE 1
#define PATH "/data/storage/el2/base/files"
#define ONEVAL 1
#define MINUSONE -1
#define TWOVAL 2
#define SIXFOURVAL 64
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL -1
#define RETURN_0 0
#define FAILD -1
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192

#define INIT -1
#define SUCCESS_DIRENT 0
static napi_value Opendir(napi_env env, napi_callback_info info)
{
    DIR *dir = opendir("/data/storage/el2/base/files/test.txt");
    int ret = FAIL;
    if (!dir) {
        ret = SUCCESS_DIRENT;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Telldir(napi_env env, napi_callback_info info)
{
    DIR *dir;
    struct dirent *ptr;
    int counter = PARAM_0;
    dir = opendir(PATH);
    long offset1 = telldir(dir);
    while ((ptr = readdir(dir)) != nullptr) {
        counter++;
        if (counter > ONE) {
            telldir(dir);
            break;
        }
    }
    closedir(dir);
    napi_value result;
    napi_create_double(env, offset1, &result);
    return result;
}

static napi_value Scandir64(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIXFOURVAL, stresult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    open(strTemp, O_RDWR);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    struct dirent **namelist;
    napi_value result;
    if (valueFirst == PARAM_0) {
        int total = scandir64(strTemp, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    } else {
        int total = scandir64(nullptr, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    }
    return result;
}

static napi_value Scandir(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIXFOURVAL, stresult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    open(strTemp, O_RDWR);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    struct dirent **namelist;
    napi_value result;
    if (valueFirst == PARAM_0) {
        int total = scandir(strTemp, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    } else {
        int total = scandir(nullptr, &namelist, PARAM_0, alphasort);
        napi_create_int32(env, total, &result);
    }
    return result;
}

static napi_value Seekdir(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[PARAM_0], &valueFirst);
    napi_value result;
    DIR *dir = opendir("/data/storage/el2/base/files/");
    readdir(dir);
    errno = ERRON_0;
    if (valueFirst == PARAM_0) {
        seekdir(dir, TWOVAL);
    } else if (valueFirst == ONEVAL) {
        seekdir(dir, PARAM_0);
    }
    if (errno == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value Readdir(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int result_value = FAILD;
    if (param == PARAM_UNNORMAL) {
        DIR *dir = (DIR *)"";
        struct dirent *ret;
        errno = ERRON_0;
        ret = readdir(dir);
        if (errno != PARAM_0) {
            result_value = errno;
        }
        if (ret == nullptr) {
            result_value = errno;
        }
    } else {
        DIR *dir;
        struct dirent *ret;
        dir = opendir("/data/storage/el2/base/files/");
        ret = readdir(dir);
        if (ret != nullptr) {
            result_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value ReaddirR(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int result_value = FAILD;
    if (param == PARAM_0) {
        DIR *dir = opendir("/data/storage/el2/base/files/");
        struct dirent buf;
        struct dirent *res;
        result_value = readdir_r(dir, &buf, &res);
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value Readdir64(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int result_value = FAILD;
    if (param == PARAM_UNNORMAL) {
        DIR *dir = (DIR *)" ";
        struct dirent *ret;
        ret = readdir64(dir);
        if (ret == nullptr) {
            result_value = RETURN_0;
        } else {
            result_value = SIZE_100;
        }
    } else {
        DIR *dir;
        struct dirent *ret;
        dir = opendir("/data/storage/el2/base/files/");
        ret = readdir64(dir);
        if (ret != nullptr) {
            result_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value Readdir64R(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int result_value = FAILD;
    if (param == PARAM_0) {
        DIR *dir = opendir("/data/storage/el2/base/files/");
        struct dirent buf;
        struct dirent *res;
        result_value = readdir64_r(dir, &buf, &res);
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value Rewinddir(napi_env env, napi_callback_info info)
{
    DIR *dir = opendir("/data/storage/el2/base/files/");
    struct dirent *ret;
    rewinddir(dir);
    ret = readdir(dir);
    int result_value = PARAM_0;
    if (ret != nullptr) {
        result_value = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value FdOpenDir(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files";
    int fileDescribe = open(path, O_CREAT);
    errno = INIT;
    DIR *getDir = fdopendir(fileDescribe);
    if (getDir != nullptr) {
        errno = SUCCESS_DIRENT;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value CloseDir(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files";
    DIR *getDir = opendir(path);
    int backParam;
    backParam = closedir(getDir);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DirFd(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files";
    DIR *getDir = opendir(path);
    int backParam;
    backParam = dirfd(getDir);
    closedir(getDir);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Alphasort(napi_env env, napi_callback_info info)
{

    struct dirent **namelist;
    open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    int total = scandir("/data/storage/el2/base/files", &namelist, PARAM_0, alphasort);
    int resultValue = ERROR;
    if (total > PARAM_0) {
        resultValue = SUCCESS_DIRENT;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Alphasort64(napi_env env, napi_callback_info info)
{

    struct dirent **namelist;
    open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    int total = scandir("/data/storage/el2/base/files", &namelist, PARAM_0, alphasort64);
    int resultValue = ERROR;
    if (total > PARAM_0) {
        resultValue = SUCCESS_DIRENT;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Getdents(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS_DIRENT, &result);
    return result;
}

static napi_value Getdents64(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS_DIRENT, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"telldir", nullptr, Telldir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scandir64", nullptr, Scandir64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scandir", nullptr, Scandir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seekdir", nullptr, Seekdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdir", nullptr, Readdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdirR", nullptr, ReaddirR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdir64", nullptr, Readdir64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rewinddir", nullptr, Rewinddir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readdir64R", nullptr, Readdir64R, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdopendir", nullptr, FdOpenDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closedir", nullptr, CloseDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dirfd", nullptr, DirFd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alphasort", nullptr, Alphasort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alphasort64", nullptr, Alphasort64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdents", nullptr, Getdents, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdents64", nullptr, Getdents64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"opendir", nullptr, Opendir, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "dirent",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
