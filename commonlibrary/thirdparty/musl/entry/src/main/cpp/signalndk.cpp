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
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <node_api.h>
#include <sys/signalfd.h>
#include <unistd.h>
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_6000 6000
#define PARAM_99999 99999
#define FAIL -1
#define NO_ERR 0
#define STRLENGTH 64
#define SUCCESS 1
#define ONE 1
#define SFD_CLOEXEC O_CLOEXEC
#define ONEVAL 1
#define MINUSONE -1
#define MINUSTWO -2
#define THRVAL 3
#define ERRON_0 0

static napi_value Sighold(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    if (valueFirst == PARAM_0) {
        int sig = SIGALRM;
        int sigValue = sighold(sig);
        napi_create_int32(env, sigValue, &result);
    } else {
        int sigValue = sighold(valueSecond);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigrelse(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    if (valueFirst == PARAM_0) {
        int sig = SIGALRM;
        int sigValue = sigrelse(sig);
        napi_create_int32(env, sigValue, &result);
    } else {
        int sigValue = sigrelse(valueSecond);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigdelset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set = {PARAM_0};
    if (valueFirst == PARAM_0) {
        int sig = SIGINT;
        sigemptyset(&set);
        int sigValue = sigdelset(&set, sig);
        napi_create_int32(env, sigValue, &result);
    } else {
        sigemptyset(&set);
        int sigValue = sigdelset(&set, valueSecond);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigaddset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set = {PARAM_0};
    if (valueFirst == PARAM_0) {
        int sig = SIGQUIT;
        sigemptyset(&set);
        int sigValue = sigaddset(&set, sig);
        napi_create_int32(env, sigValue, &result);
    } else {
        sigemptyset(&set);
        int sigValue = sigaddset(&set, valueSecond);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigemptyset(napi_env env, napi_callback_info info)
{
    sigset_t set = {PARAM_0};
    int sigValue = sigemptyset(&set);
    napi_value result = nullptr;
    napi_create_int32(env, sigValue, &result);
    return result;
}

static napi_value Sigfillset(napi_env env, napi_callback_info info)
{
    sigset_t set = {PARAM_0};
    int sigValue = sigfillset(&set);
    napi_value result = nullptr;
    napi_create_int32(env, sigValue, &result);
    return result;
}

void SignalHandler(int signum) { }

static napi_value Sigaction(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    struct sigaction sigabrt = {.sa_handler = SignalHandler};
    if (valueFirst == PARAM_0) {
        int sigValue = sigaction(SIGABRT, &sigabrt, nullptr);
        napi_create_int32(env, sigValue, &result);
    } else {
        int sigValue = sigaction(valueSecond, &sigabrt, nullptr);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigaltstack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    stack_t ss = {PARAM_0};
    ss.ss_size = SIGSTKSZ;
    if (valueFirst == PARAM_0) {
        ss.ss_flags = PARAM_0;
        int sigValue = sigaltstack(&ss, nullptr);
        napi_create_int32(env, sigValue, &result);
    } else {
        ss.ss_flags = MINUSONE;
        int sigValue = sigaltstack(&ss, nullptr);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigignore(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    if (valueFirst == PARAM_0) {
        int sigValue = sigignore(SIGALRM);
        napi_create_int32(env, sigValue, &result);
    } else {
        int sigValue = sigignore(valueSecond);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Sigpause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int sigValue = sighold(SIGALRM);
    if (sigValue != MINUSONE || errno != EINTR) {

        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Sigpending(napi_env env, napi_callback_info info)
{
    sigset_t pending = {PARAM_0};
    int sigValue = sigpending(&pending);
    napi_value result = nullptr;
    napi_create_int32(env, sigValue, &result);
    return result;
}

static napi_value Sigprocmask(napi_env env, napi_callback_info info)
{
    napi_value result = {PARAM_0};
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set = {PARAM_0}, set2 = {PARAM_0};
    if (valueFirst == PARAM_0) {
        int sigValue = sigprocmask(SIG_UNBLOCK, &set, &set2);
        napi_create_int32(env, sigValue, &result);
    } else {
        int sigValue = sigprocmask(valueSecond, &set, &set2);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static napi_value Kill(napi_env env, napi_callback_info info)
{

    napi_value result = {PARAM_0};
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Killpg(napi_env env, napi_callback_info info)
{
    napi_value result = {PARAM_0};
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Psignal(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    size_t size = STRLENGTH;
    char valueSecond[STRLENGTH];
    size_t actualVal = PARAM_0;
    napi_get_value_string_utf8(env, args[1], valueSecond, size, &actualVal);
    napi_value result = nullptr;
    psignal(valueFirst, valueSecond);
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value PSigInfo(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    napi_value result = nullptr;
    char paramSecond[STRLENGTH];
    siginfo_t siginfo = {PARAM_0};
    psiginfo(&siginfo, paramSecond);
    int returnValue = FAIL;
    if (errno == NO_ERR) {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Raise(napi_env env, napi_callback_info info)
{
    napi_value result = PARAM_0;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Sigwait(napi_env env, napi_callback_info info)
{
    sigset_t set = {0};
    sigemptyset(&set);
    int sig = SIGALRM;
    sigaddset(&set, sig);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    union sigval sigval = {.sival_int = ONE};
    sigqueue(getpid(), sig, sigval);
    sig = PARAM_0;
    int result = sigwait(&set, &sig);
    napi_value napi_value1 = nullptr;
    napi_create_int32(env, result, &napi_value1);
    return napi_value1;
}

static napi_value Sigwaitinfo(napi_env envs, napi_callback_info infos)
{
    sigset_t set;
    sigemptyset(&set);
    int sig = SIGALRM;
    sigaddset(&set, sig);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    union sigval sigval = {.sival_int = ONE};
    sigqueue(getpid(), sig, sigval);
    siginfo_t info;
    int result = sigwaitinfo(&set, &info);
    napi_value napi_values = nullptr;
    napi_create_int32(envs, result, &napi_values);
    return napi_values;
}
static napi_value Sigismember(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set = {PARAM_0};
    napi_value result;
    if (valueFirst == PARAM_0) {
        int sig = SIGALRM;
        int sigValue = sigismember(&set, sig);
        napi_create_int32(env, sigValue, &result);
    }
    if (valueFirst == MINUSONE) {
        int sigValue = sigismember(&set, valueSecond);
        napi_create_int32(env, sigValue, &result);
    } else {
        sigemptyset(&set);
        sigaddset(&set, SIGINT);
        int sigValue = sigismember(&set, SIGINT);
        napi_create_int32(env, sigValue, &result);
    }
    return result;
}

static int g_count = PARAM_0;
static void signal_handler(int signo) { g_count++; }
static napi_value Signal(napi_env env, napi_callback_info info)
{
    napi_value result = PARAM_0;
    errno = ERRON_0;
    signal(SIGHUP, signal_handler);
    if (errno == PARAM_0) {
        napi_create_int32(env, errno, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value Signalfd(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    const int sig = SIGALRM;
    sigset_t mask = {};
    napi_value result = PARAM_0;
    sigaddset(&mask, sig);
    sigprocmask(SIG_SETMASK, &mask, nullptr);
    int fd = signalfd(MINUSONE, &mask, SFD_CLOEXEC);
    if (errno == PARAM_0 && fd != MINUSONE) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static inline void unsupported_api(const char *func) { fprintf(stderr, "[ERR]Unsupported API %s\n", func); }
static napi_value Siginterrupt(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int sig = SIGABRT;
    int flag = PARAM_0;
    struct sigaction sa;
    unsupported_api(__FUNCTION__);
    struct sigaction sigabrt = {.sa_handler = SignalHandler};
    sigaction(sig, &sigabrt, nullptr);
    if (flag)
        sa.sa_flags &= ~SA_RESTART;
    else
        sa.sa_flags |= SA_RESTART;
    int sigval = siginterrupt(sig, ONEVAL);
    napi_value result = PARAM_0;
    napi_create_int32(env, sigval, &result);
    return result;
}

static napi_value Sigset(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    napi_value result = {nullptr};
    if (valueFirst == PARAM_0) {
        sigset(SIGALRM, SIG_DFL);
    } else {
        sigset(PARAM_99999, SIG_DFL);
    }
    if (errno == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value Sigtimedwait(napi_env env, napi_callback_info info)
{
    sigset_t set = {PARAM_0};
    pid_t pid = PARAM_0;
    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set, nullptr);
    pid = fork();
    napi_value result = PARAM_0;
    if (pid == MINUSONE) {
        napi_create_int32(env, MINUSTWO, &result);
    } else if (pid) {
        sigset_t set2 = {PARAM_0};
        siginfo_t siginfo = {PARAM_0};
        struct timespec timeout = {THRVAL, PARAM_0};
        sigemptyset(&set2);
        sigaddset(&set2, SIGCHLD);
        int signal = sigtimedwait(&set2, &siginfo, &timeout);
        if (signal > PARAM_0) {
            napi_create_int32(env, PARAM_0, &result);
        } else {
            napi_create_int32(env, MINUSONE, &result);
        }
    }
    return result;
}

static napi_value Sigqueue(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond = PARAM_0;
    napi_get_value_int32(env, args[1], &valueSecond);
    union sigval sigval = {.sival_int = ONEVAL};
    if (valueFirst == PARAM_0) {
        int sig = SIGALRM;
        int sigValue = sigqueue(getpid(), sig, sigval);
        napi_value result = {PARAM_0};
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sigqueue(getpid(), valueSecond, sigval);
        napi_value result = PARAM_0;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}


static napi_value BsdSignal(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sighold", nullptr, Sighold, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigrelse", nullptr, Sigrelse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigdelset", nullptr, Sigdelset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigaddset", nullptr, Sigaddset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigemptyset", nullptr, Sigemptyset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigfillset", nullptr, Sigfillset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigaction", nullptr, Sigaction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigaltstack", nullptr, Sigaltstack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigignore", nullptr, Sigignore, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigpause", nullptr, Sigpause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigpending", nullptr, Sigpending, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigprocmask", nullptr, Sigprocmask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigismember", nullptr, Sigismember, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signal", nullptr, Signal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signalfd", nullptr, Signalfd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"siginterrupt", nullptr, Siginterrupt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigset", nullptr, Sigset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigtimedwait", nullptr, Sigtimedwait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigqueue", nullptr, Sigqueue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigwait", nullptr, Sigwait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigwaitinfo", nullptr, Sigwaitinfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigwaitinfo", nullptr, Sigwaitinfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"kill", nullptr, Kill, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"killpg", nullptr, Killpg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"raise", nullptr, Raise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"psignal", nullptr, Psignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pSigInfo", nullptr, PSigInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"bsdSignal", nullptr, BsdSignal, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "signal",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
