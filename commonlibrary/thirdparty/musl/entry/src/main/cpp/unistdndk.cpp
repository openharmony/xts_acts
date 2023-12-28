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
#include <cstdlib>
#include <cerrno>
#include <fcntl.h>
#include <getopt.h>
#include <glob.h>
#include <ifaddrs.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <node_api.h>
#include <cstring>
#include <sys/inotify.h>
#include <sys/random.h>
#include <sys/syscall.h>
#include <sys/sysinfo.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>
#define BACKGROUND (0)
#define FOREGROUND (1)
#define TCGETPGRPERROR (-1)
#define ONEVAL 1
#define LASTONEVAL -1
#define THIRTEEN 13

#define SUCCESS 1
#define FAIL -1
#define ONE 1
#define LENGTH 64
#define TWO 2
#define SIZE_64 64
#define DEF_VALUE -2
#define PATHONE "/data/storage/el2/base/files/test.txt"
#define PATH2 "/data/storage/el2/base/files/text2.txt"
#define FILEPATH "/data/storage/el2/base/files"
#define TEST_ALARM_TIME 2
#define NO_ERR 0
#define TEST_MODE 0666
#define TEST_0777 0777
#define TEST_ID_VALUE 100

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_10 10
#define PARAM_UNNORMAL -1
#define RETURN_0 0
#define FAILD -1
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_200 200
#define SIZE_4096 4096
#define SIZE_8192 8192
#define TIMEDIFF 2000
#define TEST_BUFFER_SIZE 64
#define MINUSONE -1
#define GROUPS_MAX 2
extern "C" ssize_t __pread_chk(int fd, void *buf, size_t count, off_t offset, size_t buf_size);
extern "C" ssize_t __read_chk(int, void *, size_t, size_t);
extern "C" char *__getcwd_chk(char *, size_t, size_t);
extern "C" ssize_t __readlink_chk(const char*, char*, size_t, size_t);

static napi_value Setpgid(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int second;
    napi_get_value_int32(env, args[1], &second);
    pid_t pid = first;
    pid_t pgid = second;
    int setpgidd = setpgid(pid, pgid);
    napi_value result;
    napi_create_int32(env, setpgidd, &result);
    return result;
}

static napi_value Setpgrp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    napi_value result;
    pid_t pt = setpgrp();
    if (first == LASTONEVAL) {
        if (pt == LASTONEVAL && getpgrp() != getpid()) {
            napi_create_double(env, pt, &result);
        } else {
            napi_create_double(env, ONEVAL, &result);
        }
    } else {
        napi_create_double(env, pt, &result);
    }
    return result;
}

static napi_value Setresuid(napi_env env, napi_callback_info info)
{
    uid_t uid = LASTONEVAL;
    int setval = setresuid(uid, uid, uid);
    napi_value result;
    napi_create_int32(env, setval, &result);
    return result;
}

static napi_value GetGroups(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);

    int getInfo = FAIL;
    int size = valueZero;
    gid_t list[10];
    getInfo = getgroups(size, list);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetPid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = getpid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPPid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = getppid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPGrp(napi_env env, napi_callback_info info)
{
    int setResult = setpgrp();
    pid_t getInfo = FAIL;
    if (setResult == PARAM_0) {
        getInfo = getpgrp();
    }
    if (getInfo != FAIL) {
        getInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPGid(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    pid_t getInfo = getpgid(getpid());
    if (getInfo != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetSid(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);

    pid_t getInfo = FAIL;
    getInfo = getsid(valueZero);
    if (FAIL != getInfo) {
        getInfo = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetUid(napi_env env, napi_callback_info info)
{
    uid_t uid = getuid();
    int ret = FAIL;
    if (uid != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetLogin(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    char *getInfo = nullptr;
    getInfo = getlogin();
    int ret = FAIL;
    if (getInfo != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetLoginR(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    char szUserName[64] = {0};
    int getInfo = getlogin_r(szUserName, sizeof(szUserName) - ONE);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetOpt(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = LENGTH, strResult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);

    napi_get_value_string_utf8(env, args[0], strTemp, length, &strResult);
    optind = PARAM_0;
    int optArgc = PARAM_3;
    char cmdline[50] = "./parse_cmdline";
    char para[100] = "100";
    char *optArgv[] = {cmdline, strTemp, para};
    char optString[50] = "a:b:c:d";
    int getInfo = getopt(optArgc, optArgv, optString);

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetTid(napi_env env, napi_callback_info info)
{
    pid_t getInfo = FAIL;
    getInfo = gettid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetEUid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = PARAM_0;
    getInfo = geteuid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetGid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = PARAM_0;
    getInfo = getgid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetEGid(napi_env env, napi_callback_info info)
{
    uid_t getInfo = PARAM_0;
    getInfo = getegid();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetHostName(napi_env env, napi_callback_info info)
{
    char name[65];
    int getInfo = gethostname(name, sizeof(name));
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetPageSize(napi_env env, napi_callback_info info)
{
    int getInfo = getpagesize();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetDTableSize(napi_env env, napi_callback_info info)
{
    int getInfo = getdtablesize();
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}
static napi_value GetReSuid(napi_env env, napi_callback_info info)
{
    uid_t ruid = THIRTEEN;
    uid_t euid = THIRTEEN;
    uid_t suid = THIRTEEN;

    int getInfo = getresuid(&ruid, &euid, &suid);

    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetResGid(napi_env env, napi_callback_info info)
{
    gid_t rgid = THIRTEEN;
    gid_t egid = THIRTEEN;
    gid_t sgid = THIRTEEN;
    int getInfo = getresgid(&rgid, &egid, &sgid);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value Sleep(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    int sin_value = sleep(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Isatty(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/test.txt", O_CREAT);
    int sin_value = isatty(fd);
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Swab(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *sigValue;
    char src[20] = "ABCD";
    char dest[20] = "abcd";
    if (valueFirst == PARAM_0) {
        swab(src, dest, TWO);
        sigValue = dest;
    } else {
        swab(src, dest, FAIL);
        sigValue = dest;
    }
    napi_value result;
    napi_create_string_utf8(env, sigValue, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Sync(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    sync();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Syncfs(napi_env env, napi_callback_info info)
{
    int syncfs_value = syncfs(FAIL);
    napi_value result = nullptr;
    napi_create_int32(env, syncfs_value, &result);
    return result;
}

static napi_value Syscall(napi_env env, napi_callback_info info)
{
    pid_t tid;
    tid = syscall(SYS_gettid);
    napi_value result = nullptr;

    if (tid > PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
        return result;
    } else {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
}

static napi_value Sysinfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int sys_value;
    if (valueFirst == PARAM_0) {
        struct sysinfo infos;
        sys_value = sysinfo(&infos);
    } else {
        sys_value = sysinfo(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sys_value, &result);
    return result;
}

static napi_value Sync_file_range(napi_env env, napi_callback_info info)
{
    int sync_value = sync_file_range(FAIL, PARAM_0, PARAM_0, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, sync_value, &result);
    return result;
}

static napi_value Symlink(napi_env env, napi_callback_info info)
{
    char file_name[] = PATHONE;
    char link_name[] = PATH2;
    int syslink_result = symlink(file_name, link_name);
    napi_value result = nullptr;
    napi_create_int32(env, syslink_result, &result);
    return result;
}

static napi_value Symlinkat(napi_env env, napi_callback_info info)
{
    char symlink_name[] = "teat";
    int fd = PARAM_0;
    int syslinkat_result = symlinkat(PATHONE, fd, symlink_name);
    unlinkat(fd, symlink_name, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, syslinkat_result, &result);
    return result;
}


int tcgetpgrp_handler(void)
{
    pid_t pid;
    errno = ERRON_0;
    pid = tcgetpgrp(STDIN_FILENO);
    if (pid == -1) {
        return TCGETPGRPERROR;
    } else if (pid == getpgrp()) {
        return FOREGROUND;
    } else {
        return BACKGROUND;
    }
}
static napi_value Tcsetpgrp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;
    if (valueFirst == PARAM_0) {
        result = tcsetpgrp(FAIL, FAIL);
    } else {
        tcgetsid(STDIN_FILENO);
        tcgetpgrp_handler();
        result = tcsetpgrp(STDIN_FILENO, getpgrp());
        tcgetpgrp_handler();
        result = tcsetpgrp(STDIN_FILENO, getpgrp());
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Tcgetpgrp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;
    if (valueFirst == PARAM_0) {
        result = tcgetpgrp(FAIL);
    } else {
        tcgetsid(STDIN_FILENO);
        result = tcgetpgrp_handler();
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Read(napi_env env, napi_callback_info info)
{
    char msg[] = "This is a c test code for write function";
    char buf[SIZE_100];
    int len = strlen(msg);
    int fd = open("/data/storage/el2/base/files/testRead.txt", O_CREAT);
    int bytes = read(fd, buf, len);
    napi_value result = nullptr;
    if (bytes > PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }

    return result;
}

static napi_value Readlink(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    int result_value = FAILD;
    if (param == PARAM_UNNORMAL) {
        char *buf = nullptr;
        int ret;
        const char *softptr = "./noreadlink.txt.soft";
        ret = readlink(softptr, buf, sizeof(buf));
        if (ret < PARAM_0) {
            result_value = RETURN_0;
        }
    } else {
        struct stat sb;
        char *buf;
        int ret;
        buf = (char *)malloc(sb.st_size + 1);
        errno = ERRON_0;
        ret = readlink("/data/storage/el2/base/files/testReadlink.txt", buf, sizeof(buf));
        if (errno != ERRON_0) {
            result_value = errno;
        }
        if (ret > PARAM_0) {
            result_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Readlinkat(napi_env env, napi_callback_info info)
{
    ssize_t bytes = readlinkat(PARAM_UNNORMAL, nullptr, nullptr, PARAM_0);

    napi_value result = nullptr;
    int result_value = FAILD;
    if (bytes < PARAM_0) {
        result_value = RETURN_0;
    }

    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Rmdir(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);
    int result_value = FAILD;
    if (param == PARAM_UNNORMAL) {
        char path[] = "testerror";
        result_value = rmdir(path);
    } else {
        char path[] = "/data/storage/el2/base/files/testRmdir";
        if (access(path, F_OK) != PARAM_0) {
            mkdir(path, TEST_0777);
            result_value = rmdir(path);
        } else {
            remove(path);
            mkdir(path, TEST_0777);
            result_value = rmdir(path);
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value Ttyname(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int isOpenFile = FAIL;

    napi_get_value_int32(env, args[0], &isOpenFile);
    int value0 = FAIL;

    if (isOpenFile == PARAM_1) {
        char file[SIZE_100] = "/dev/tty";
        value0 = open(file, O_RDONLY);
    } else {
        char file[SIZE_100] = "/unexit";
        value0 = open(file, O_RDONLY);
    }

    int tojsResult = FAIL;

    if (value0 == FAIL) {
        char *ttyname_value = ttyname(value0);
        if (ttyname_value == nullptr) {
            tojsResult = PARAM_0;
        }
    } else {
        char *ttyname_value = ttyname(value0);
        if (ttyname_value != nullptr) {
            tojsResult = PARAM_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, tojsResult, &result);

    return result;
}

static napi_value Ttyname_r(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int isOpenFile = FAIL;
    int tojsResult = FAIL;
    napi_get_value_int32(env, args[0], &isOpenFile);

    if (isOpenFile != PARAM_1) {
        int fd = open("/dev/null", O_WRONLY);
        char buf[PARAM_1];
        tojsResult = ttyname_r(fd, buf, sizeof(buf));
        if (tojsResult == ENOTTY) {
            tojsResult = PARAM_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, tojsResult, &result);

    return result;
}

static napi_value Truncate(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    int truncate_value = truncate(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, truncate_value, &result);
    return result;
}

static napi_value Truncate64(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    int truncate_value = truncate64(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, truncate_value, &result);
    return result;
}

static napi_value Unlink(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = SIZE_64, stresult = PARAM_0;
    char valueFirst[length];
    napi_get_value_string_utf8(env, args[0], valueFirst, length, &stresult);

    int unlinkResult = unlink(valueFirst);

    napi_value result = nullptr;
    napi_create_int32(env, unlinkResult, &result);
    return result;
}

static napi_value Unlinkat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = SIZE_64, stresult = PARAM_0;
    char valueFirst[length];
    napi_get_value_string_utf8(env, args[0], valueFirst, length, &stresult);

    int unlinkatResult = DEF_VALUE;
    if (strcmp(valueFirst, "/dev/file.txt") == PARAM_0) {
        unlinkatResult = unlinkat(AT_FDCWD, valueFirst, AT_REMOVEDIR);
    } else {
        int fd = open(valueFirst, O_CREAT);
        unlinkatResult = unlinkat(fd, valueFirst, PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, unlinkatResult, &result);
    return result;
}

static napi_value Usleep(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    struct timespec old_time;
    clock_gettime(CLOCK_MONOTONIC, &old_time);

    int usleepResult = usleep(valueFirst);
    struct timespec new_time;
    clock_gettime(CLOCK_MONOTONIC, &new_time);

    long int difference = new_time.tv_sec - old_time.tv_sec - TIMEDIFF;

    int toJs = FAIL;
    if (usleepResult == PARAM_0 && difference <= TWO) {
        toJs = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}
static napi_value PreadChk(napi_env env, napi_callback_info info)
{
    const char *txt = "This is pread_0100 test.";
    char buffer[TEST_BUFFER_SIZE];
    memset(buffer, 0x0, sizeof(buffer));
    int fd = open("/data/storage/el2/base/files/testRead.txt", O_CREAT);
    pwrite(fd, txt, strlen(txt), PARAM_0);
    lseek(fd, PARAM_0, SEEK_SET);
    int offset = PARAM_0;
    size_t pread_chk = __pread_chk(fd, buffer, 0, offset, strlen(buffer));
    napi_value result;
    napi_create_int32(env, pread_chk, &result);
    return result;
}

static napi_value Access(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    int returnValue = access("/data/storage/el2/base/files/fzl.txt", F_OK);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Close(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    backParam = close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FchDir(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    fileDescribe = open(pathname, flags);
    backParam = fchdir(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FExecVe(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    char strTemp[] = "/data/storage/el2/base/files/Fzl.txt";
    char *const argv[] = {strTemp, nullptr};
    char *const envp[] = {nullptr};
    backParam = fexecve(fileDescribe, argv, envp);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FDataSync(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    backParam = fdatasync(fileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FchOwn(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    uid_t uid = getuid();
    gid_t gid = getpid();
    backParam = fchown(fileDescribe, uid, gid);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FAccessAt(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    mode = F_OK;
    flags = AT_EACCESS;
    backParam = faccessat(fileDescribe, pathname, mode, flags);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecVpe(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    char *const firstParam[] = {nullptr};
    char *const secondParam[] = {nullptr};
    backParam = execvpe(pathname, firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecVp(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    char *const firstParam[1] = {nullptr};
    backParam = execvp(pathname, firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecVe(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    char *const firstParam[] = {nullptr};
    char *const secondParam[] = {nullptr};
    backParam = execve(pathname, firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecLp(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    const char *firstParam = nullptr;
    backParam = execlp(pathname, firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecLe(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *pathname = "/data/storage/el2/base/files/LXL.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    const char *firstParam = nullptr;
    backParam = execle(pathname, firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FChOwnAt(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe, flag = AT_EMPTY_PATH;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    uid_t owner = getuid();
    gid_t group = getgid();
    backParam = fchownat(fileDescribe, pathname, owner, group, flag);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecL(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    const char *arg = "";
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    fork();
    backParam = execl(pathname, arg);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CTerMid(napi_env env, napi_callback_info info)
{
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    char str[64] = "/data/storage/el2/base/files/Fzl.txt";
    open(pathname, flags, mode);
    const char *backParam = ctermid(str);
    if (backParam) {
        backParam = "true";
    }
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Copy_file_range(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribeOut, writeLen, fileDescribeIn = 35;
    const char *str = "hello";
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribeOut = open(pathname, flags, mode);
    writeLen = write(fileDescribeOut, str, strlen(str));
    backParam = copy_file_range(fileDescribeOut, nullptr, fileDescribeIn, nullptr, writeLen, 0);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Daemon(napi_env env, napi_callback_info info)
{
    int firstFileDescribe, secondFileDescribe;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    firstFileDescribe = open(pathname, flags, mode);
    secondFileDescribe = fork();
    int backParam = daemon(firstFileDescribe, secondFileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dup3(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int backParam, fileDescribe, firstParam, secondParam = O_CLOEXEC;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &firstParam);
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    backParam = dup3(fileDescribe, firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dup2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int backParam, fileDescribe, firstParam;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &firstParam);
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_RDONLY;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    backParam = dup2(fileDescribe, firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dup(napi_env env, napi_callback_info info)
{
    int backParam, fileDescribe;
    const char *pathname = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_RDONLY;
    mode_t mode = S_IRWXU;
    fileDescribe = open(pathname, flags, mode);
    backParam = dup(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value ExecV(napi_env env, napi_callback_info info)
{
    char s1[] = "/data/storage/el2/base/files";
    char s2[] = "/Fzl.txt";
    char *args[3];
    args[0] = s1;
    args[1] = s2;
    args[2] = nullptr;
    int backParam = execv(args[0], args);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Alarm(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    napi_value result = nullptr;

    int resultValue = alarm(param);
    napi_create_int32(env, resultValue, &result);

    return result;
}

void *get_brk() { return sbrk(PARAM_0); }
static napi_value Brk(napi_env env, napi_callback_info info)
{
    void *initial_break = get_brk();
    void *new_break = (void *)((uintptr_t)(initial_break) + 1);
    int resultValue = brk(new_break);

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Acct(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, FAIL, &result);
    return result;
}

static napi_value Getentropy(napi_env env, napi_callback_info info)
{
    void *buffer[256];
    int resultValue = getentropy(buffer, 256);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Getdomainname(napi_env env, napi_callback_info info)
{
    char cbuf[BUFSIZ] = {PARAM_0};
    int resultValue = getdomainname(cbuf, sizeof(cbuf));
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Getcwd(napi_env env, napi_callback_info info)
{
    char *value;
    char buf[200] = {PARAM_0};
    value = getcwd(buf, sizeof(buf));
    int resultValue = FAIL;
    if (value != nullptr) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Fork(napi_env env, napi_callback_info info)
{
    pid_t fpid;

    fpid = fork();
    int ret = FAIL;
    if (fpid != FAIL) {
        ret = SUCCESS;
    }
    close(fpid);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value Fpathconf(napi_env env, napi_callback_info info)
{
    long value = fpathconf(0, _PC_LINK_MAX);
    int ret = FAIL;
    if (value != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value Chdir(napi_env env, napi_callback_info info)
{
    int returnValue = chdir("/data/storage/el2/base/files");
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Chown(napi_env env, napi_callback_info info)
{
    int getUId = getuid();
    int getGId = getgid();
    int returnValue = chown("/data/storage/el2/base/files", getUId, getGId);
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Chroot(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, NO_ERR, &result);
    return result;
}

static napi_value Fsync(napi_env env, napi_callback_info info)
{
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    int ret = fsync(fd);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Ftruncate(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, ERRON_0, &result);
    return result;
}

static napi_value Ftruncate64(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, ERRON_0, &result);
    return result;
}

static napi_value LChOwn(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64, stresult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);

    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    errno = ERRON_0;
    int value = lchown(strTemp, TEST_ID_VALUE, TEST_ID_VALUE);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Link(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = 32;
    char *oldPath = (char *)malloc(sizeof(char) * lenV);
    char *newPath = (char *)malloc(sizeof(char) * lenV);
    napi_get_value_string_utf8(env, args[0], oldPath, lenV, &lenA);
    napi_get_value_string_utf8(env, args[1], newPath, lenV, &lenA);

    int value = link(oldPath, newPath);

    errno = ERRON_0;

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value LinkAt(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = 32;
    char *oldPath = (char *)malloc(sizeof(char) * lenV);
    char *newPath = (char *)malloc(sizeof(char) * lenV);

    napi_get_value_string_utf8(env, args[0], oldPath, lenV, &lenA);
    napi_get_value_string_utf8(env, args[1], newPath, lenV, &lenA);

    int newFd = creat(newPath, 666);

    int value = linkat(AT_FDCWD, oldPath, newFd, newPath, AT_SYMLINK_FOLLOW);

    errno = ERRON_0;

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value LockF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = 32;
    char *path = (char *)malloc(sizeof(char) * lenV);
    int ret;
    napi_get_value_string_utf8(env, args[0], path, lenV, &lenA);

    int fd = open(path, O_RDWR | O_CREAT, 0666);
    ret = lockf(fd, F_LOCK, 0);

    errno = ERRON_0;

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value LockF64(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t lenA;
    size_t lenV = 32;
    char *path = (char *)malloc(sizeof(char) * lenV);
    int ret;
    napi_get_value_string_utf8(env, args[0], path, lenV, &lenA);

    int fd = open(path, O_RDWR | O_CREAT, 0666);

    ret = lockf64(fd, F_LOCK, 0);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getrandom(napi_env env, napi_callback_info info)
{
    void *buf = malloc(32);
    ssize_t ret = getrandom(buf, 32, PARAM_0);
    napi_value result = nullptr;
    if (ret != PARAM_UNNORMAL) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    }
    return result;
}
static napi_value Glob(napi_env env, napi_callback_info info)
{
    glob_t buf;
    int ret = glob("/data/storage/el2/base/files/*", GLOB_NOSORT, nullptr, &buf);
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    }
    globfree(&buf);
    return result;
}

static napi_value Globfree(napi_env env, napi_callback_info info)
{
    glob_t buf;
    int ret = glob("/data/storage/el2/base/files/*", GLOB_NOSORT, nullptr, &buf);
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    }
    globfree(&buf);
    return result;
}

static napi_value Lseek(napi_env env, napi_callback_info info)
{
    int fd1;
    char chA = 'a';
    fd1 = open("a.txt", O_RDONLY);
    write(fd1, &chA, PARAM_1);
    int ret = lseek(fd1, PARAM_0, SEEK_END);
    close(fd1);
    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Lseek64(napi_env env, napi_callback_info info)
{
    int fd1;
    char chA = 'a';
    fd1 = open("a.txt", O_RDONLY);
    write(fd1, &chA, PARAM_1);
    int ret = lseek64(fd1, PARAM_0, SEEK_END);
    close(fd1);
    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value ReadLink(napi_env env, napi_callback_info info)
{
    char buf[SIZE_64] = "";
    int fp = open("/data/storage/el2/base/files/Fzl.txt", O_RDONLY);
    close(fp);
    ssize_t ret = readlink("/data/storage/el2/base/files/Fzl.txt", buf, 127);
    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value ReadLinkAt(napi_env env, napi_callback_info info)
{
    char buf[SIZE_64]= ""; 
    int fp = open("/data/storage/el2/base/files/Fzl.txt", O_RDONLY);
    close(fp);
    ssize_t ret = readlinkat(fp, "/data/storage/el2/base/files/Fzl.txt", buf, 127);
    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env,PARAM_UNNORMAL , &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

extern char *optarg;
extern int optind, opterr, optopt;
static napi_value Optarg(napi_env env, napi_callback_info info)
{
    int ch;
    int argc = 5;
    char param1[] = "./getopt";
    char param2[] = "-a";
    char param3[] = "f";
    char param4[] = "-b";
    char param5[] = "-ci";

    char *argv2[5] = {param1, param2, param3, param4, param5};
    char optstring[] = "a:bc::";
    ch = getopt(argc, argv2, optstring);
    int res = PARAM_0;
    if (ch == 'a') {
        if (optarg[0] == 'f') {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value Optind(napi_env env, napi_callback_info info)
{
    int ch;
    int argc = 5;
    char param1[] = "./getopt";
    char param2[] = "-a";
    char param3[] = "f";
    char param4[] = "-b";
    char param5[] = "-ci";

    char *argv2[5] = {param1, param2, param3, param4, param5};
    char optstring[] = "a:bc::";
    ch = getopt(argc, argv2, optstring);
    int res = PARAM_0;
    if (ch == 'a') {
        if (optind == PARAM_3) {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value Optopt(napi_env env, napi_callback_info info)
{
    int ch;
    int argc = 5;
    char param1[] = "./getopt";
    char param2[] = "-a";
    char param3[] = "f";
    char param4[] = "-b";
    char param5[] = "-ci";

    char *argv2[5] = {param1, param2, param3, param4, param5};
    char optstring[] = "a:bc::";
    ch = getopt(argc, argv2, optstring);
    int res = PARAM_0;
    if (ch == 'a') {
        if (optopt == PARAM_0) {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value Opterr(napi_env env, napi_callback_info info)
{
    int ch;
    int argc = 5;
    char param1[] = "./getopt";
    char param2[] = "-a";
    char param3[] = "f";
    char param4[] = "-b";
    char param5[] = "-ci";
    char *argv2[5] = {param1, param2, param3, param4, param5};
    char optstring[] = "a:bc::";
    ch = getopt(argc, argv2, optstring);
    int res = PARAM_0;
    if (ch == 'a') {
        if (opterr == PARAM_1) {
            res = SUCCESS;
        } else {
            res = FAIL;
        }
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value PRead(napi_env env, napi_callback_info info)
{
    const char *txt = "This is pread_0100 test.";
    int ret = PARAM_UNNORMAL;
    char buffer[64];
    int bufferSize = 64;
    memset(buffer, 0x0, sizeof(buffer));
    int fd = open("/data/storage/el2/base/files/test.txt", O_CREAT | O_RDWR);
    pwrite(fd, txt, strlen(txt), PARAM_0);
    lseek(fd, PARAM_0, SEEK_SET);
    size_t cnt = pread(fd, buffer, bufferSize, PARAM_0);
    if (cnt == strlen(txt)) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PWrite(napi_env env, napi_callback_info info)
{
    int ret = PARAM_UNNORMAL;
    char tmpfile[] = "/data/storage/el2/base/files/memfd_creat01200.txt";

    const char *txt = "This is pwrite_0100 test.";
    char buffer[64];
    memset(buffer, 0x0, sizeof(buffer));

    int fd = open(tmpfile, O_CREAT | O_RDWR, TEST_MODE);

    size_t cnt = pwrite(fd, txt, strlen(txt), PARAM_0);
    if (cnt == strlen(txt)) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    if (access(tmpfile, F_OK) == PARAM_0) {
        unlink(tmpfile);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PRead64(napi_env env, napi_callback_info info)
{
    const char *txt = "This is pread_0100 test.";
    int ret = PARAM_UNNORMAL;
    char buffer[64];
    int bufferSize = 64;
    memset(buffer, 0x0, sizeof(buffer));
    char tmpfile[] = "/data/storage/el2/base/files/memfd_creat0100.txt";
    int fd = open(tmpfile, O_CREAT | O_RDWR);
    pwrite(fd, txt, strlen(txt), PARAM_0);
    lseek(fd, PARAM_0, SEEK_SET);
    size_t cnt = pread64(fd, buffer, bufferSize, PARAM_0);
    if (cnt == strlen(txt)) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PWrite64(napi_env env, napi_callback_info info)
{
    int ret = PARAM_UNNORMAL;
    char tmpfile[] = "/data/storage/el2/base/files/memfd_creat01200.txt";

    const char *txt = "This is pwrite_0100 test.";
    char buffer[64];
    memset(buffer, 0x0, sizeof(buffer));

    int fd = open(tmpfile, O_CREAT | O_RDWR, TEST_MODE);

    size_t cnt = pwrite64(fd, txt, strlen(txt), PARAM_0);
    if (cnt == strlen(txt)) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    close(fd);
    if (access(tmpfile, F_OK) == PARAM_0) {
        unlink(tmpfile);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Nice(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[0], &value);
    int ret = nice(value);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Pipe(napi_env env, napi_callback_info info)
{
    int fd[2];
    int ret = pipe(fd);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Pipe2(napi_env env, napi_callback_info info)
{
    int fd[2];
    int ret = pipe2(fd, O_CLOEXEC);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Pathconf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    napi_value result = nullptr;
    int status = PARAM_0;
    psignal(WTERMSIG(status), "signal");
    napi_create_int32(env, errno, &result);
    return result;
}

int gtest_pause_flag = PARAM_0;

static napi_value Pause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Pread(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t size = 64;
    char buffer[100];
    off_t offset = PARAM_10;
    char *value = (char *)malloc(sizeof(char) * size);
    size_t actualVal;
    napi_get_value_string_utf8(env, args[0], value, size, &actualVal);

    napi_value result = nullptr;
    ssize_t ret = pread(open(value, O_RDWR), buffer, sizeof(buffer), offset);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Setsid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setdomainname(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setgroups(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setgid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_UNNORMAL, &result);
    return result;
}

static napi_value Seteuid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setegid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setreuid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setregid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Setresgid(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value ReadChk(napi_env env, napi_callback_info info) {

    char msg[] = "This is a c test code for write function";
    char buf[SIZE_100];
    int len = strlen(msg);
    int fd = open("/data/storage/el2/base/files/testReadChk.txt", O_CREAT);
    ssize_t bytes = __read_chk(fd, buf, len, sizeof(buf));
    napi_value result = nullptr;
    if (bytes > PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}
static napi_value GetcwdChk(napi_env env, napi_callback_info info) {
    char manual[] = "/data/storage/el2/base/files/";
    char hdc_auto[] = "/";
    char *ret;
    char buf[200] = {0};
    ret = __getcwd_chk(buf, sizeof(buf), sizeof(buf));
    int result_value = FAILD;
    if ((strcmp(ret, manual) ^ strcmp(ret, hdc_auto))) {
        result_value = RETURN_0;
    } else {
        result_value = FAILD;
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Issetugid(napi_env env, napi_callback_info info) {

    int ret = issetugid();
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}
static napi_value ReadlinkChk(napi_env env, napi_callback_info info) {

    int result_value = FAILD;
    struct stat sb;
    char *buf;
    int ret;
    buf = (char *)malloc(sb.st_size + 1);

    char *buff = (char *)malloc(128);
    int fp = open("/data/storage/el2/base/files/testReadlinkChk.txt", O_CREAT);
    close(fp);
    ret = __readlink_chk("/data/storage/el2/base/files/testReadlinkChk.txt", buff, sizeof(buf), sizeof(buf));

    ret = __readlink_chk("/data/storage/el2/base/files/testReadlinkChk.txt", buff, sizeof(buf), sizeof(buf));
    if (ret > PARAM_0) {
        result_value = RETURN_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Vfork(napi_env env, napi_callback_info info)
{
    int a = PARAM_1;
    int toJs = DEF_VALUE;
    pid_t pid = vfork();
    if (pid < PARAM_0) {
        toJs = FAIL;
    }
    if (pid == PARAM_0) {
        sleep(PARAM_1);
        a = SIZE_10;
        _exit(PARAM_0);
    }
    else if (pid > PARAM_0) {
        if (a != PARAM_1) {
            toJs = PARAM_0;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}
static napi_value Sethostname(napi_env env, napi_callback_info info)
{
    napi_value resval;
    napi_create_int32(env, PARAM_0, &resval);
    return resval;
}

static napi_value Setuid(napi_env env, napi_callback_info info)
{
    napi_value result;
	napi_create_int32(env, PARAM_0, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getGroups", nullptr, GetGroups, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPid", nullptr, GetPid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPPid", nullptr, GetPPid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPGrp", nullptr, GetPGrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPGid", nullptr, GetPGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSid", nullptr, GetSid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getUid", nullptr, GetUid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLogin", nullptr, GetLogin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLoginR", nullptr, GetLoginR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOpt", nullptr, GetOpt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getTid", nullptr, GetTid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEUid", nullptr, GetEUid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGid", nullptr, GetGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEGid", nullptr, GetEGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHostName", nullptr, GetHostName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPageSize", nullptr, GetPageSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDTableSize", nullptr, GetDTableSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getReSuid", nullptr, GetReSuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResGid", nullptr, GetResGid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sleep", nullptr, Sleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lChOwn", nullptr, LChOwn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"link", nullptr, Link, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"linkAt", nullptr, LinkAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lockF", nullptr, LockF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lockF64", nullptr, LockF64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getrandom", nullptr, Getrandom, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glob", nullptr, Glob, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"globfree", nullptr, Globfree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isatty", nullptr, Isatty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"swab", nullptr, Swab, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sync", nullptr, Sync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"syncfs", nullptr, Syncfs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"syscall", nullptr, Syscall, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sysinfo", nullptr, Sysinfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sync_file_range", nullptr, Sync_file_range, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"symlinkat", nullptr, Symlinkat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"symlink", nullptr, Symlink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcgetpgrp", nullptr, Tcgetpgrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcsetpgrp", nullptr, Tcsetpgrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpgid", nullptr, Setpgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpgrp", nullptr, Setpgrp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setresuid", nullptr, Setresuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"read", nullptr, Read, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlink", nullptr, Readlink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlinkat", nullptr, Readlinkat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rmdir", nullptr, Rmdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate", nullptr, Truncate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate64", nullptr, Truncate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unlink", nullptr, Unlink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unlinkat", nullptr, Unlinkat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usleep", nullptr, Usleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ttyname", nullptr, Ttyname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ttyname_r", nullptr, Ttyname_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"access", nullptr, Access, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"close", nullptr, Close, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchdir", nullptr, FchDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execv", nullptr, ExecV, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dup", nullptr, Dup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dup2", nullptr, Dup2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dup3", nullptr, Dup3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ctermid", nullptr, CTerMid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execl", nullptr, ExecL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchownat", nullptr, FChOwnAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execle", nullptr, ExecLe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execlp", nullptr, ExecLp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execve", nullptr, ExecVe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execvp", nullptr, ExecVp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"faccessat", nullptr, FAccessAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fexecve", nullptr, FExecVe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdatasync", nullptr, FDataSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fchown", nullptr, FchOwn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"daemon", nullptr, Daemon, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copy_file_range", nullptr, Copy_file_range, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"execvpe", nullptr, ExecVpe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alarm", nullptr, Alarm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"brk", nullptr, Brk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"acct", nullptr, Acct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getentropy", nullptr, Getentropy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getcwd", nullptr, Getcwd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fork", nullptr, Fork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fpathconf", nullptr, Fpathconf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdomainname", nullptr, Getdomainname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chdir", nullptr, Chdir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chown", nullptr, Chown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"chroot", nullptr, Chroot, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fsync", nullptr, Fsync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftruncate", nullptr, Ftruncate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftruncate64", nullptr, Ftruncate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lseek", nullptr, Lseek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lseek64", nullptr, Lseek64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readLink", nullptr, ReadLink, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readLinkAt", nullptr, ReadLinkAt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate", nullptr, Truncate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncate64", nullptr, Truncate64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optarg", nullptr, Optarg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optind", nullptr, Optind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optopt", nullptr, Optopt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"opterr", nullptr, Opterr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pRead", nullptr, PRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pWrite", nullptr, PWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pRead64", nullptr, PRead64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pWrite64", nullptr, PWrite64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nice", nullptr, Nice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pipe", nullptr, Pipe, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pipe2", nullptr, Pipe2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pathconf", nullptr, Pathconf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pause", nullptr, Pause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pread", nullptr, Pread, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"preadchk", nullptr, PreadChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setsid", nullptr, Setsid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setdomainname", nullptr, Setdomainname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setgroups", nullptr, Setgroups, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setgid", nullptr, Setgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setuid", nullptr, Setuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seteuid", nullptr, Seteuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setegid", nullptr, Setegid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setreuid", nullptr, Setreuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setregid", nullptr, Setregid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setresgid", nullptr, Setresgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readChk", nullptr, ReadChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlinkChk", nullptr, ReadlinkChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getcwdChk", nullptr, GetcwdChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"issetugid", nullptr, Issetugid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfork", nullptr, Vfork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sethostname", nullptr, Sethostname, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "unistd",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }