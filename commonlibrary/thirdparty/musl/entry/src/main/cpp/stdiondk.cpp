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
#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <malloc.h>
#include <net/if.h>
#include <poll.h>
#include <cstdarg>
#include <sys/inotify.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>


#define SBUF_SIZE 128
#define ONEVAL 1
#define MINUSONE -1
#define SIXFOUR 64
#define ONEEIGHT 18
#define MAX_NAMBER 1024
#define HUNDRED 100
#define MAX_NUMBER 128
#define NO_ERR 0
#define SUCCESS 1
#define FAIL -1
#define SIZE_64 64
#define PARAM_123 123
#define PARAM_321 321
#define HUNDRED 100
#define PATH "/data/storage/el2/base/files"
#define STRLENGTH 64
#define ONE 1
#define TWO 2
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL -1
#define RETURN_0 0
#define FAILD -1
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_20 20
#define SIZE_100 100
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define ONESIX 16
#define TWOVAL 2
#define DEF_VALUE -2
#define PARAM_10 10
#define PATH "/data/storage/el2/base/files"
const int32_t PUTC_RET = 112;

extern "C" size_t __fread_chk(void *, size_t, size_t, FILE *, size_t);
extern "C" int __vsnprintf_chk(char *dest, size_t supplied_size, int flags, size_t dst_len_from_compiler,
                               const char *format, va_list va);
extern "C" char *__fgets_chk(char *, int, FILE *, size_t);
extern "C" ssize_t __pwrite_chk(int fd, const void *buf, size_t count, off_t offset, size_t buf_size);
extern "C" ssize_t __write_chk(int fd, const void *buf, size_t count, size_t buf_size);
extern "C" ssize_t __readlinkat_chk(int dirfd, const char *path, char *buf, size_t size, size_t buf_size);
extern "C" int __sprintf_chk(char *dest, int flags, size_t dst_len_from_compiler, const char *format, ...);
extern "C" int __snprintf_chk(char *dest, size_t supplied_size, int flags, size_t dst_len_from_compiler,
                              const char *format, ...);
extern "C" int __ppoll_chk(struct pollfd *fds, nfds_t fd_count, const struct timespec *timeout, const sigset_t *mask,
                           size_t fds_size);

#define TEST_MODE 0666
#define STR_VFSCANF_TXT "/data/storage/el2/base/files/Fzl.txt"
extern "C" int fpurge(FILE *stream);

char sbuf[SBUF_SIZE];
static napi_value GetLine(napi_env env, napi_callback_info info)
{
    char wrstring[] = "helloworld";
    char *line = nullptr;
    size_t len = PARAM_0;
    char ptr[PATH_MAX] = "/data/storage/el2/base/files/Fzl.txt";

    FILE *fp = fopen(ptr, "w+");
    fwrite(wrstring, sizeof(char), strlen(wrstring), fp);
    fseek(fp, PARAM_0, SEEK_SET);

    ssize_t read = getline(&line, &len, fp);

    fclose(fp);
    remove(ptr);
    int ret = FAIL;
    if (read != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Printf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    size_t size = STRLENGTH;
    char value[STRLENGTH];
    size_t actualVal;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], value, size, &actualVal);
    napi_create_double(env, printf("%s", value), &result);

    return result;
}

static napi_value Nrand48(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    unsigned short xsubi[3] = {1, 2, 3};
    napi_create_double(env, nrand48(xsubi), &result);
    return result;
}

static napi_value Putchar(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int ret;
    if (valueFirst == PARAM_0) {
        ret = putchar('0');
    }
    if (valueFirst == ONE) {
        ret = putchar('a');
    }
    if (valueFirst == TWO) {
        ret = putchar('\n');
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PutcharUnlocked(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int ret;
    if (valueFirst == PARAM_0) {
        ret = putchar_unlocked('0');
    }
    if (valueFirst == ONE) {
        ret = putchar_unlocked('a');
    }
    if (valueFirst == TWO) {
        ret = putchar_unlocked('\n');
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Putenv(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char envir[] = "USER=test";
    int ret = putenv(envir);
    napi_create_double(env, ret, &result);
    return result;
}

static napi_value Puts(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t size = STRLENGTH;
    char value[STRLENGTH];
    size_t actualVal;

    napi_get_value_string_utf8(env, args[0], value, size, &actualVal);

    napi_value result = nullptr;
    int ret = puts(value);
    if (ret >= PARAM_0) {
        napi_create_double(env, SUCCESS, &result);
    } else {
        napi_create_double(env, FAIL, &result);
    }
    return result;
}

static napi_value OpenMemstream(napi_env env, napi_callback_info info)
{
    char *buf;
    size_t size;
    FILE *stream = open_memstream(&buf, &size);
    int ret = FAIL;
    if (stream) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value POpen(napi_env env, napi_callback_info info)
{
    FILE *read_fp;
    char buf[1024];
    memset(buf, '\0', sizeof(buf));
    read_fp = popen("pwd", "r");
    int res = PARAM_0;
    if (read_fp != nullptr) {
        res = SUCCESS;
        pclose(read_fp);
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
static napi_value PClose(napi_env env, napi_callback_info info)
{
    FILE *read_fp = nullptr;
    char buf[1024];
    memset(buf, '\0', sizeof(buf));
    read_fp = popen("pwd", "r");
    int res = FAIL;
    if (read_fp != nullptr) {
        fread(buf, sizeof(char), sizeof(buf), read_fp);
        res = pclose(read_fp);
    } else {
        res = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value Perror(napi_env env, napi_callback_info info)
{
    FILE *fp;
    int res = FAIL;
    fp = fopen("/home/book/test_file", "r+");
    if (nullptr == fp) {
        perror("fopen error");
        res = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value StdErr(napi_env env, napi_callback_info info)
{
    int stderrFd = fileno(stderr);
    napi_value result = nullptr;
    napi_create_int32(env, stderrFd, &result);
    return result;
}
static napi_value StdIn(napi_env env, napi_callback_info info)
{
    int stderrFd = fileno(stdin);
    napi_value result = nullptr;
    napi_create_int32(env, stderrFd, &result);
    return result;
}
static napi_value StdOut(napi_env env, napi_callback_info info)
{
    int stderrFd = fileno(stdout);
    napi_value result = nullptr;
    napi_create_int32(env, stderrFd, &result);
    return result;
}
static napi_value Gets(napi_env env, napi_callback_info info)
{
    char str1[50];
    char *ptr = gets(str1);
    int ret = FAIL;
    if (ptr != nullptr) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PutCUnlocked(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/fzl.txt";
    if (access(path, F_OK) == PARAM_0) {
        remove(path);
    }
    open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    fopen("/data/storage/el2/base/files/fzl.txt", "w");
    int param = 'A';
    int returnValue = putc_unlocked(param, stdout);
    if(returnValue > PARAM_0){
        returnValue = PARAM_1;
    }
    if (access(path, F_OK) == PARAM_0) {
        remove(path);
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Putc(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64, stresult = PARAM_0;
    char strTemp[length];
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);

    FILE *fp = fopen(strTemp, "w");
    int returnValue = putc('p', fp);
    int ret = FAIL;
    if (returnValue == PUTC_RET) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    fclose(fp);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Sprintf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);
    char buffer[SIZE_20];
    int sprintf_value = DEF_VALUE;
    int toJs = DEF_VALUE;
    if (isSuccessCase == PARAM_1) {
        sprintf_value = sprintf(buffer,"hello : %s", "world!");
        if (sprintf_value > PARAM_0) {
            toJs = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value Snprintf(napi_env env, napi_callback_info info)
{
    char buffer[20];
    const char *format = "AB";
    int snprintf_value = snprintf(buffer, PARAM_0, format, format);
    napi_value result = nullptr;
    napi_create_int32(env, snprintf_value, &result);
    return result;
}

static napi_value Sscanf(napi_env env, napi_callback_info info)
{
    const char *fmt = "temp";
    char s[] = "temp";
    int snprintf_value = sscanf(s, fmt, fmt);
    napi_value result = nullptr;
    napi_create_int32(env, snprintf_value, &result);
    return result;
}

static napi_value Tempnam(napi_env env, napi_callback_info info)
{
    char dir[] = PATH;
    char pte[] = "temp";
    char *temp = tempnam(dir, pte);
    napi_value result = nullptr;
    napi_create_string_utf8(env, temp, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Tmpfile(napi_env env, napi_callback_info info)
{
    FILE *f = tmpfile();
    int file_value = PARAM_0;
    if (f == nullptr) {
        file_value = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, file_value, &result);
    return result;
}

static napi_value Tmpfile64(napi_env env, napi_callback_info info)
{
    FILE *f = tmpfile64();
    int file_value = PARAM_0;
    if (f == nullptr) {
        file_value = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, file_value, &result);
    return result;
}

static napi_value Tmpnam(napi_env env, napi_callback_info info)
{
    char buffer[L_tmpnam];
    char *p = tmpnam(buffer);
    napi_value result = nullptr;
    napi_create_string_utf8(env, p, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Setvbuf(napi_env env, napi_callback_info info)
{
    char buf[MAX_NAMBER] = "hello world";
    int setval = setvbuf(stdin, buf, _IOFBF, sizeof(buf));
    napi_value result;
    napi_create_int32(env, setval, &result);
    return result;
}

static napi_value Scanf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int a, b, c;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIXFOUR, stresult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[PARAM_0], strTemp, length, &stresult);
    open(strTemp, O_RDWR);
    int scaval = scanf(strTemp, &a, &b, &c);
    napi_value result;
    napi_create_int32(env, scaval, &result);
    return result;
}

int vfprintftest(char *file_name, char *format, char *func_name, char *want_reuslt, ...)
{
    FILE *file = fopen(file_name, "w");
    va_list ap;
    va_start(ap, want_reuslt);
    int vfpval = vfprintf(file, format, ap);
    va_end(ap);
    fclose(file);
    return vfpval;
}

static napi_value Vfprintf(napi_env env, napi_callback_info info)
{
    char vtest[] = "/data/storage/el2/base/files/test.txt";
    char vtest_1[] = "value is %s and %d";
    char vtest_2[] = "vfprintf_0100";
    char vtest_3[] = "value is qwe and 1";
    int vfpval = vfprintftest(vtest, vtest_1, vtest_2,
                              vtest_3, "qwe", "1");
    napi_value result;
    if (vfpval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

int vfscanf_n_test(char *stream, char *format, char *func_name, char *want_reuslt, ...)
{
    FILE *file = fopen(stream, "w");
    va_list ap;
    va_start(ap, want_reuslt);
    int vfpsval = vfscanf(file, format, ap);
    va_end(ap);
    fclose(file);
    return vfpsval;
}

int vprintf()
{
    va_list ap;
    return vfprintf(stdout, "/data/storage/el2/base/files/test.txt", ap);
}

int vprintfTestt(char *format, ...)
{
    va_list args;
    va_start(args, format);
    int vprval = vprintf(format, args);
    va_end(args);
    return vprval;
}

static napi_value Vprintf(napi_env env, napi_callback_info info)
{
    char vprintf[] = "value is %s";
    char vprintf_test[] = "OK";
    int vprval = vprintfTestt(vprintf, vprintf_test);
    napi_value result;
    if (vprval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

int GetMatches(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int vscval = vscanf(format, args);
    va_end(args);
    return vscval;
}

int MyPrintF(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int vsnval = vsnprintf(sbuf, SBUF_SIZE, format, args);
    va_end(args);
    return vsnval;
}
static napi_value Vsnprintf(napi_env env, napi_callback_info info)
{
    int vsnval = MyPrintF("my name is %s,my age is %d\n", "bob", ONEEIGHT);
    napi_value result;
    if (vsnval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

int PrintFError(const char *format, ...)
{
    char buffer[MAX_NUMBER];
    va_list args;
    va_start(args, format);
    int vspval = vsprintf(buffer, format, args);
    perror(buffer);
    va_end(args);
    return vspval;
}

int GetMatches(const char *str, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    int vssval = vsscanf(str, format, args);
    va_end(args);
    return vssval;
}

static napi_value Vsscanf(napi_env env, napi_callback_info info)
{
    int val = PARAM_0;
    char buf[HUNDRED];
    int vssval = GetMatches("99 bottles of beer on the wall", " %d %s ", &val, buf);
    napi_value result;
    if (vssval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Remove(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/testRemove.txt";
    int result_value = remove(path);
    napi_value result = nullptr;

    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Rename(napi_env env, napi_callback_info info)
{
    char oldName[] = "/data/storage/el2/base/files/testRenameOld.txt";
    char newName[] = "/data/storage/el2/base/files/testRenameNew.txt";
    int result_value = rename(oldName, newName);
    napi_value result = nullptr;

    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Renameat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int caseNumber;
    napi_get_value_int32(env, args[0], &caseNumber);
    char oldName[] = "/data/storage/el2/base/files/testRenameOld.txt";
    char newName[] = "/data/storage/el2/base/files/testRenameNew.txt";
    int result_value;
    if (caseNumber == PARAM_0) {
        int oldFd = PARAM_0;
        int newFd = PARAM_0;
        result_value = renameat(oldFd, oldName, newFd, newName);
    } else {
        int oldFd = open(oldName, O_CREAT);
        int newFd = open(newName, O_CREAT);
        result_value = renameat(oldFd, oldName, newFd, newName);
    }

    napi_value result = nullptr;

    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Rewind(napi_env env, napi_callback_info info)
{
    FILE *ptr = fopen("/data/storage/el2/base/files/testRewind.txt", "r");
    errno = ERRON_0;
    rewind(ptr);
    int result_value = feof(ptr);
    if (errno != ERRON_0) {
        result_value = FAILD;
    }
    napi_value result = nullptr;

    napi_create_int32(env, result_value, &result);
    return result;
}

static napi_value Putw(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int result_value = FAILD;

    if (param == PARAM_0) {
        FILE *fp = fopen("/data/storage/el2/base/files/testPutw.txt", "w+");
        int result = putw(10, fp);
        if (result == RETURN_0) {
            result_value = RETURN_0;
        }
    } else {
        FILE *fp = fopen("/data/storage/el2/base/files/testPutw.txt", "w+");
        errno = ERRON_0;
        putw(PARAM_10, fp);
        if (errno == EOF) {
            result_value = FAILD;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, result_value, &result);

    return result;
}

static napi_value Ungetc(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    int ungetcValue = ungetc(valueFirst, stdin);

    napi_value result = nullptr;
    napi_create_int32(env, ungetcValue, &result);
    return result;
}

int readFile(int stream, char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int result = vdprintf(stream, fmt, ap);
    va_end(ap);
    return result;
}

static napi_value Vdprintf(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int isOpenFile;
    napi_get_value_int32(env, args[0], &isOpenFile);

    int resultValue = PARAM_0;
    char value[] = "asdf";
    char buffer[HUNDRED] = {PARAM_0};
    if (isOpenFile == PARAM_0) {
        int fp = FAIL;
        char ps[] = "%s";
        resultValue = readFile(fp, ps, value);
    } else {
        size_t length = SIZE_64, stresult = PARAM_0;
        char strTemp[length];
        napi_get_value_string_utf8(env, args[1], strTemp, length, &stresult);
        char ps[] = "%s";
        int fp = open(strTemp, O_RDWR | O_CREAT);
        int result = readFile(fp, ps, value);
        close(fp);
        fp = open(strTemp, O_RDWR);
        read(fp, buffer, strlen(value));

        if (result >= PARAM_0 && strcmp(buffer, "asdf") == PARAM_0) {
            resultValue = SUCCESS;
        }
        close(fp);
        unlink(strTemp);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

int vasprintf_0100(char *v, ...)
{
    va_list ap;
    va_start(ap, v);
    char ta[] = " ";
    char *temp = ta;
    int result = vasprintf(&temp, v, ap);
    if (result < 0 || strcmp(temp, "value is 123 and 321.") != PARAM_0) {
        result = FAIL;
    }
    va_end(ap);
    return result;
}

static napi_value Vasprintf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int caseNumber;
    int toJs = FAIL;
    napi_get_value_int32(env, args[0], &caseNumber);
    if (caseNumber == PARAM_1) {
        char cb[] = "value is %d and %d.";
        int value = vasprintf_0100(cb, PARAM_123, PARAM_321);
        if (value != FAIL) {
            toJs = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value Fpurge(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64, stresult = PARAM_0;
    char strTemp[length];
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    char buf[SIZE_100];
    char str[] = "This is a test";
    int returnValue = FAIL;
    FILE *fp = fopen(strTemp, "w");
    fputs(str, fp);
    size_t ret = fpurge(fp);
    fgets(buf, SIZE_100, fp);
    if(strstr(buf, str) == PARAM_0 && ret == PARAM_0){
        returnValue = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    fclose(fp);
    remove(strTemp);
    return result;
}

static napi_value Asprintf(napi_env env, napi_callback_info info)
{

    char *testStr = nullptr;
    int num = PARAM_0;
    int ret = FAIL;
    if (asprintf(&testStr, "%d", num) != FAIL) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    free(testStr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getdelim(napi_env env, napi_callback_info info)
{

    char wrstring[] = "hello,world";
    char *line = nullptr;
    size_t len = NO_ERR;

    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    fwrite(wrstring, sizeof(char), strlen(wrstring), fp);
    fseek(fp, NO_ERR, SEEK_SET);

    ssize_t value = getdelim(&line, &len, ',', fp);
    int ret = FAIL;
    if (value) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getchar(napi_env env, napi_callback_info info)
{
    const char *path = "/data/readtest.txt";
    char str[] = "t";
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    write(fd, str, sizeof(str));
    freopen(path, "r", stdin);
    char ch = getchar();
    int value = FAIL;
    if (ch) {
        value = SUCCESS;
    }
    close(fd);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GetcharUnlocked(napi_env env, napi_callback_info info)
{

    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    FILE *fp = freopen(path, "r", stdin);
    char ch = getchar_unlocked();
    int value = FAIL;
    if (ch) {
        value = SUCCESS;
    }
    fclose(fp);
    close(fd);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Getc(napi_env env, napi_callback_info info)
{

    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(path, "w+");

    char ch = getc(fptr);
    int value = FAIL;
    if (ch) {
        value = SUCCESS;
    }
    fclose(fptr);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GetcUnlocked(napi_env env, napi_callback_info info)
{

    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(path, "w+");

    char ch = getc_unlocked(fptr);
    int value = FAIL;
    if (ch) {
        value = SUCCESS;
    }
    fclose(fptr);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Fwrite(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(path, "w+");
    char buf[] = "this is test";
    int ret = FAIL;
    int value = fwrite(buf, sizeof(char), strlen(buf), fptr);
    if (value > NO_ERR) {
        ret = SUCCESS;
    }
    fclose(fptr);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FwriteUnlocked(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(path, "w+");
    char buf[] = "this is test";
    int ret = FAIL;
    int value = fwrite_unlocked(buf, sizeof(char), strlen(buf), fptr);
    if (value > NO_ERR) {
        ret = SUCCESS;
    }
    fclose(fptr);
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fopen(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(path, "w+");
    int ret = FAIL;
    if (fptr != nullptr) {
        ret = SUCCESS;
    }
    fclose(fptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fopen64(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen64(path, "w+");
    int ret = FAIL;
    if (fptr != nullptr) {
        ret = SUCCESS;
    }
    fclose(fptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fprintf(napi_env env, napi_callback_info info)
{
    char str[] = "This is a fprintf_0100";
    int32_t len = fprintf(stdout, "%s", str);
    int ret = FAIL;
    if (len > NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fputc(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = fputc('c', fptr);
    int ret = FAIL;
    if (value > NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FputcUnlocked(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = fputc_unlocked('c', fptr);
    int ret = FAIL;
    if (value > NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fputs(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int len = fputs("this is a test string", fptr);
    int ret = FAIL;
    if (len >= NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FputsUnlocked(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int len = fputs_unlocked("this is a test string", fptr);
    int ret = FAIL;
    if (len >= NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fread(napi_env env, napi_callback_info info)
{

    char abc[100] = {0};
    const char *wrstring = "starttowritehelloworld";
    const char *ptr = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(ptr, "w+");

    fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
    fseek(fptr, NO_ERR, SEEK_SET);

    size_t rsize = fread(abc, PARAM_1, 10, fptr);

    fclose(fptr);
    remove(ptr);
    int ret = FAIL;
    if (rsize > NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value FreadUnlocked(napi_env env, napi_callback_info info)
{

    char abc[100] = {0};
    const char *wrstring = "starttowritehelloworld";
    const char *ptr = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(ptr, "w+");

    fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
    fseek(fptr, NO_ERR, SEEK_SET);

    size_t rsize = fread_unlocked(abc, PARAM_1, 10, fptr);

    fclose(fptr);
    remove(ptr);
    int ret = FAIL;
    if (rsize > NO_ERR) {
        ret = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ClearErr(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    int returnValue = NO_ERR;
    FILE *Param = fopen("/data/storage/el2/base/files", "r");
    clearerr(Param);
    if (errno == NO_ERR) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value ClearerrUnlocked(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    int returnValue = FAIL;
    FILE *Param = fopen("/data/storage/el2/base/files", "r");
    clearerr_unlocked(Param);
    if (errno == NO_ERR) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Freopen(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    int returnValue = FAIL;

    FILE *fp;
    fp = freopen("/data/storage/el2/base/files/Fzl.txt", "w+", stdin);

    fclose(stdin);
    fclose(fp);
    if (fp) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Freopen64(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    int returnValue = FAIL;

    FILE *fp;
    fp = freopen64("/data/storage/el2/base/files/Fzl.txt", "w+", stdin);

    fclose(stdin);
    fclose(fp);
    if (fp) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Fscanf(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    int res;
    double value = NO_ERR;
    FILE *fp;
    fp = fopen("/data/storage/el2/base/files/Fzl.txt", "r");
    res = fscanf(fp, "%lf", &value);
    if (res > NO_ERR) {
        returnValue = SUCCESS;
    }
    fclose(fp);
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Fseek(napi_env env, napi_callback_info info)
{

    long ret = 10;
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = fseek(fp, ret, SEEK_SET);

    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Fseeko(napi_env env, napi_callback_info info)
{

    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = fseeko(fp, 0L, SEEK_SET);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Fseeko64(napi_env env, napi_callback_info info)
{

    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = fseeko64(fp, 0L, SEEK_SET);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Fsetpos(napi_env env, napi_callback_info info)
{

    fpos_t pos;
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    fgetpos(fp, &pos);
    int value = fsetpos(fp, &pos);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Fsetpos64(napi_env env, napi_callback_info info)
{

    fpos_t pos;
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    fgetpos(fp, &pos);
    int value = fsetpos64(fp, &pos);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Ftell(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = PARAM_0;
    long ret = ftell(fptr);
    if (ret >= NO_ERR) {
        value = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Ftello(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = PARAM_0;
    long ret = ftello(fptr);
    if (ret >= NO_ERR) {
        value = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Ftello64(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int value = PARAM_0;
    long ret = ftello64(fptr);
    if (ret >= NO_ERR) {
        value = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Ftrylockfile(napi_env env, napi_callback_info info)
{

    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");

    int ret = ftrylockfile(fptr);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

void *child_func(void *p)
{
    char buf[64];
    FILE *fptr = fopen("/data/storage/el2/base/files/Fzl.txt", "r+");
    flockfile(fptr);
    fseek(fptr, 0L, SEEK_SET);
    fread(buf, STRLENGTH, PARAM_1, fptr);
    fseek(fptr, 0L, SEEK_SET);
    fwrite(buf, strlen(buf), PARAM_1, fptr);
    funlockfile(fptr);
    fclose(fptr);
    return nullptr;
}
static napi_value Funlockfile(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    pthread_t tid[10];
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    fclose(fp);
    for (int i = 0; i < PARAM_10; i++) {
        errno = ERRON_0;
        pthread_create(tid + i, nullptr, child_func, nullptr);
    }
    int ret = FAIL;
    if (errno == NO_ERR) {
        ret = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Fread_chk(napi_env env, napi_callback_info info)
{
    size_t bos = PARAM_0;
    FILE *file;
    char buffer[20];
    file = fopen(PATH, "r");
    int ret = __fread_chk(buffer, bos, bos, file, bos);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

int VsnprintfChkSSS(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    size_t bos = __DIAGNOSE_BOS(format);
    int vsnval = __vsnprintf_chk(sbuf, SBUF_SIZE, PARAM_0, bos, format, args);
    va_end(args);
    return vsnval;
}
static napi_value VsnprintfChk(napi_env env, napi_callback_info info)
{

    int vsnval = VsnprintfChkSSS("my name is %s,my age is %d\n", "bob", ONEEIGHT);
    napi_value result;
    if (vsnval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value FgetsChk(napi_env env, napi_callback_info info)
{
    char hello_world[] = "hello world!";
    FILE *fp = fmemopen(hello_world, sizeof(hello_world), "r");
    const int bufferSize = ONESIX;
    char buf[bufferSize];
    char *char_value;
    char_value = __fgets_chk(buf, sizeof(buf), fp, ONESIX);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}


static napi_value Setbuf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    char buf[BUFSIZ];
    setbuf(stdout, buf);
    puts("This is test");
    fflush(stdout);
    napi_value result;
    if (errno != PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Setbuffer(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    char buf[BUFSIZ];
    setbuffer(stdout, buf, BUFSIZ);
    puts("This is test");
    fflush(stdout);
    napi_value result;
    if (errno != PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Setlinebuf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    setlinebuf(stdout);
    puts("This is test");
    fflush(stdout);
    napi_value result;
    if (errno != PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value PwriteChk(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = SIZE_64, stresult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    char *valueSecond = NapiHelper::GetString(env, args[1]);

    int fp = open(strTemp, O_WRONLY | O_CREAT);
    ssize_t valueResult = __pwrite_chk(fp, valueSecond, strlen(valueSecond), 5, strlen(valueSecond) + PARAM_1);
    int toJs = DEF_VALUE;
    if (valueResult != FAIL) {
        toJs = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value WriteChk(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = SIZE_64, stresult = PARAM_0;
    char *strTemp = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    char *valueSecond = NapiHelper::GetString(env, args[1]);

    int fp = open(strTemp, O_WRONLY | O_CREAT);
    ssize_t valueResult = __write_chk(fp, valueSecond, strlen(valueSecond), strlen(valueSecond) + PARAM_1);
    int toJs = DEF_VALUE;
    if (valueResult != FAIL) {
        toJs = SUCCESS;
    }

    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value ReadlinkatChk(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = SIZE_64, stresult = PARAM_0;
    char strTemp[length];
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    int fp = open(strTemp, O_RDONLY);
    char path[SIZE_1024] = {PARAM_0};
    int toJs = DEF_VALUE;
    errno = ERRON_0;
    ssize_t resultValue = __readlinkat_chk(fp, strTemp, path, sizeof(path), sizeof(path));

    if (resultValue != FAIL) {
        toJs = SUCCESS;
    }
    close(fp);
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value SnprintfChk(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);
    char buffer[SIZE_20];
    int snprintf_value = DEF_VALUE;
    int toJs = DEF_VALUE;
    if (isSuccessCase == PARAM_1) {
        snprintf_value = __snprintf_chk(buffer, SIZE_20, PARAM_0, SIZE_20, "hello : %s", "world!");
        if (snprintf_value > PARAM_0) {
            toJs = PARAM_1;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

static napi_value SprintfChk(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);
    char buffer[SIZE_20];
    int sprintf_value = DEF_VALUE;
    int toJs = DEF_VALUE;
    if (isSuccessCase == PARAM_1) {
        sprintf_value = __sprintf_chk(buffer, PARAM_0, SIZE_20, "hello : %s", "world!");
        if (sprintf_value > PARAM_0) {
            toJs = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toJs, &result);
    return result;
}

int vfsf(FILE *file, char *fmt, ...)
{
    va_list argp;
    int value;
    va_start(argp, fmt);
    value = vfscanf(file, fmt, argp);
    va_end(argp);
    return value;
}
static napi_value Vfscanf(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    FILE *file;
    int i = 24;
    float fl = 40.0;
    char str[4] = "boy";
    char str_temp[] = "%d%f%s";
    file = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    int ret = vfsf(file, str_temp, i, fl, str);
    rewind(file);
    fscanf(file, "%d%f%s", &i, &fl, str);
    fclose(file);
    if (errno == NO_ERR) {
        ret = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getLine", nullptr, GetLine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sprintf", nullptr, Sprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"snprintf", nullptr, Snprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sscanf", nullptr, Sscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tempnam", nullptr, Tempnam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tmpfile", nullptr, Tmpfile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tmpfile64", nullptr, Tmpfile64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tmpnam", nullptr, Tmpnam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setvbuf", nullptr, Setvbuf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scanf", nullptr, Scanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfprintf", nullptr, Vfprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vprintf", nullptr, Vprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsnprintf", nullptr, Vsnprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsscanf", nullptr, Vsscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remove", nullptr, Remove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rename", nullptr, Rename, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"renameat", nullptr, Renameat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rewind", nullptr, Rewind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putw", nullptr, Putw, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ungetc", nullptr, Ungetc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vdprintf", nullptr, Vdprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vasprintf", nullptr, Vasprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fread_chk", nullptr, Fread_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsnprintf_chk", nullptr, VsnprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fread", nullptr, Fread, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freadUnlocked", nullptr, FreadUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintf", nullptr, Asprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getdelim", nullptr, Getdelim, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getchar", nullptr, Getchar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getc", nullptr, Getc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwrite", nullptr, Fwrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwriteUnlocked", nullptr, FwriteUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fopen", nullptr, Fopen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fputc", nullptr, Fputc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fputcUnlocked", nullptr, FputcUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fputs", nullptr, Fputs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fputsUnlocked", nullptr, FputsUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fprintf", nullptr, Fprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fopen64", nullptr, Fopen64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getcUnlocked", nullptr, GetcUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getcharUnlocked", nullptr, GetcharUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearErr", nullptr, ClearErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearerrUnlocked", nullptr, ClearerrUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freopen", nullptr, Freopen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freopen64", nullptr, Freopen64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fscanf", nullptr, Fscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fseek", nullptr, Fseek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fseeko", nullptr, Fseeko, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fseeko64", nullptr, Fseeko64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fsetpos", nullptr, Fsetpos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fsetpos64", nullptr, Fsetpos64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftell", nullptr, Ftell, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftello", nullptr, Ftello, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fpurge", nullptr, Fpurge, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftello64", nullptr, Ftello64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ftrylockfile", nullptr, Ftrylockfile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"funlockfile", nullptr, Funlockfile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLine", nullptr, GetLine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pOpen", nullptr, POpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pClose", nullptr, PClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"perror", nullptr, Perror, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLine", nullptr, GetLine, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"printf", nullptr, Printf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nrand48", nullptr, Nrand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putchar", nullptr, Putchar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putcharUnlocked", nullptr, PutcharUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putenv", nullptr, Putenv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"puts", nullptr, Puts, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openMemstream", nullptr, OpenMemstream, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stdErr", nullptr, StdErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stdIn", nullptr, StdIn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stdOut", nullptr, StdOut, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gets", nullptr, Gets, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putc", nullptr, Putc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putCUnlocked", nullptr, PutCUnlocked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetsChk", nullptr, FgetsChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setbuf", nullptr, Setbuf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setbuffer", nullptr, Setbuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setlinebuf", nullptr, Setlinebuf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pwriteChk", nullptr, PwriteChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"writeChk", nullptr, WriteChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readlinkatChk", nullptr, ReadlinkatChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"snprintfChk", nullptr, SnprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sprintfChk", nullptr, SprintfChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfscanf", nullptr, Vfscanf, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "stdio",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
