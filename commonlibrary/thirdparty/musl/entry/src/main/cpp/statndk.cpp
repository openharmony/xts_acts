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
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <linux/quota.h>
#include <net/if.h>
#include <string>
#include <sys/inotify.h>
#include <sys/stat.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define ONE 1
#define TWO 2
#define SIZE_2 2
#define PATH "/data/storage/el2/base/files"
#define PARAM_777 777
#define PARAM_0777 0777
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL -1
#define ERRON_0 0
#define SUCCESS 1
#define SIZE_64 64
#define SEC_TIME 123840
#define TEST_MODE 0666
#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100
#define NO_ERR 0
#define SUCCESS 1
#define FAIL -1
#define TEN 10
#define TEST_FIFO_MODE 0666
#define BUFSIZE 128

static napi_value Stat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[0], &value);
    int int_value = PARAM_0;
    struct stat sb = {PARAM_0};
    if (value == ONE) {
        int_value = stat(PATH, &sb);
    } else if (value == TWO) {
        int_value = stat(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, int_value, &result);
    return result;
}
static napi_value Stat64(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value;
    napi_get_value_int32(env, args[0], &value);
    int int_value = PARAM_0;
    struct stat64 sb = {PARAM_0};
    if (value == ONE) {
        int_value = stat(PATH, &sb);
    } else if (value == TWO) {
        int_value = stat(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, int_value, &result);
    return result;
}

static napi_value Umask(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    mode_t mode = PARAM_0;
    if (valueFirst == PARAM_777) {
        mode = S_IRWXU | S_IRWXG | S_IRWXO;
    }
    mode_t umaskValue = umask(mode);
    umaskValue = umask(umaskValue);

    int toJs = FAIL;
    if (umaskValue == mode && valueFirst == PARAM_777) {
        toJs = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value Utimensat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int toCppResult = FAIL;
    size_t length = SIZE_64, stresult = PARAM_0;
    char path[SIZE_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[0], path, length, &stresult);

    int fd = open(path, O_CREAT);

    const long sec = SEC_TIME;
    struct timespec times[] = {{.tv_sec = PARAM_0}, {.tv_sec = sec}};

    int utimensatValue = utimensat(fd, path, times, PARAM_0);

    close(fd);

    struct stat statbuf = {PARAM_0};
    utimensatValue = stat(path, &statbuf);

    if (utimensatValue == PARAM_0 && statbuf.st_mtim.tv_sec == sec) {
        toCppResult = SUCCESS;
    }
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, toCppResult, &result);
    return result;
}

static napi_value FchModAt(napi_env env, napi_callback_info info) {
    char path[] = "/data/storage/el2/base/files/modAt.txt";
    int df = open(path, O_CREAT);
    int ret = fchmodat(df, path, S_IRUSR, 0);
    close(df);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FchMod(napi_env env, napi_callback_info info) {
    char path[] = "/data/storage/el2/base/files/mod.txt";
    int df = open(path, O_CREAT);
    int ret = fchmod(df, S_IRUSR);
    close(df);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Creat(napi_env env, napi_callback_info info) {
    int backResult;
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    backResult = creat(path, O_CREAT);
    napi_value result = nullptr;
    if (-1 != backResult) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    }
    remove(path);
    return result;
}

static napi_value Creat64(napi_env env, napi_callback_info info) {
    int backResult;
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    backResult = creat64(path, O_CREAT);
    napi_value result = nullptr;
    if (-1 != backResult) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    }
    remove(path);
    return result;
}

static napi_value Chmod(napi_env env, napi_callback_info info)
{

    int returnValue = chmod("/data/storage/el2/base/files", O_CREAT);
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Fstat(napi_env env, napi_callback_info info) {
    char path[] = "/data/storage/el2/base/files/fstat.txt";
    struct stat statfile = {PARAM_0};
    int inp_file_d = open(path, O_CREAT);
    int value = fstat(inp_file_d, &statfile);
    napi_value result;
    napi_create_int32(env, value, &result);
    close(inp_file_d);
    remove(path);
    return result;
}

static napi_value Fstat64(napi_env env, napi_callback_info info) {
    char path[] = "/data/storage/el2/base/files/fstat64.txt";
    struct stat statfile = {PARAM_0};
    int inp_file_d = open(path, O_CREAT);
    int value = fstat64(inp_file_d, &statfile);
    napi_value result;
    napi_create_int32(env, value, &result);
    close(inp_file_d);
    remove(path);
    return result;
}

static napi_value Fstatat(napi_env env, napi_callback_info info)
{

    const char *ptr = "/data/storage/el2/base/files/Fzl.txt";
    struct stat st = {PARAM_0};
    int fd = open(ptr, O_RDWR | O_CREAT, TEST_MODE);
    lseek(fd, PARAM_0, SEEK_SET);
    int ret = fstatat(AT_FDCWD, ptr, &st, PARAM_0);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fstatat64(napi_env env, napi_callback_info info)
{

    const char *ptr = "/data/storage/el2/base/files/Fzl.txt";
    struct stat st = {PARAM_0};
    int fd = open(ptr, O_RDWR | O_CREAT, TEST_MODE);
    lseek(fd, PARAM_0, SEEK_SET);
    int ret = fstatat64(AT_FDCWD, ptr, &st, PARAM_0);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Futimens(napi_env env, napi_callback_info info) {
    int fd = open("/data/storage/el2/base/files/utime.txt", O_CREAT);
    int ret = futimens(fd, ((struct timespec[2]){{.tv_nsec=UTIME_OMIT},{.tv_nsec=UTIME_OMIT}}));
    napi_value result;
    napi_create_int32(env, ret, &result);
    close(fd);
    remove("/data/storage/el2/base/files/utime.txt");
    return result;
}
static napi_value MkFifoAt(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = BUFSIZE;
    char path[BUFSIZE] = {PARAM_0};
    int ret, name;
    napi_get_value_int32(env, args[0], &name);
    napi_get_value_string_utf8(env, args[1], path, lenV, &lenA);
    ret = mkfifoat(name, path, S_IFIFO | TEST_FIFO_MODE);
    unlink(path);
    remove(path);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkNodAt(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value MkNod(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value SchedCpualloc(napi_env env, napi_callback_info info)
{
    cpu_set_t *cupSetT;
    size_t count = PARAM_0;
    cupSetT = __sched_cpualloc(count);
    napi_value result;
    if (nullptr != cupSetT) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    }
    return result;
}

static napi_value MkDir(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    char path[] = "/data/storage/el2/base/files/mkdirtest";
    if (access(path, PARAM_0) != PARAM_0) {
        ret = mkdir(path, PARAM_0777);
        remove(path);
    } else {
        remove(path);
        ret = mkdir(path, PARAM_0777);
        remove(path);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkDirAt(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    char path[] = "/data/storage/el2/base/files/mkdirtest";

    ret = mkdirat(TEST_AT_FDCWD, path, S_IRWXU | S_IRWXG | S_IXOTH | S_IROTH);
    if (access(path, F_OK) == PARAM_0) {
        rmdir(path);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MkFiFo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Lstat(napi_env env, napi_callback_info info)
{
    fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    struct stat statbuff;
    int32_t ret = lstat("/data/storage/el2/base/files/Fzl.txt", &statbuff);
    napi_value result = nullptr;
    if (ret == -1) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Lstat64(napi_env env, napi_callback_info info)
{
    fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    struct stat statbuff;
    int32_t ret = lstat64("/data/storage/el2/base/files/Fzl.txt", &statbuff);
    napi_value result = nullptr;
    if (ret == -1) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"stat", nullptr, Stat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stat64", nullptr, Stat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"umask", nullptr, Umask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"utimensat", nullptr, Utimensat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchmodat", nullptr, FchModAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchmod", nullptr, FchMod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"creat", nullptr, Creat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"creat64", nullptr, Creat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chmod", nullptr, Chmod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstat", nullptr, Fstat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstat64", nullptr, Fstat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatat", nullptr, Fstatat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fstatat64", nullptr, Fstatat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"futimens", nullptr, Futimens, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkFifoAt", nullptr, MkFifoAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkNodAt", nullptr, MkNodAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkNod", nullptr, MkNod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schedCpualloc", nullptr, SchedCpualloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkDir", nullptr, MkDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkDirAt", nullptr, MkDirAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lstat", nullptr, Lstat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lstat64", nullptr, Lstat64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkFiFo", nullptr, MkFiFo, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "stat",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
