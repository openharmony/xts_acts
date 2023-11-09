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
#include <js_native_api.h>
#include <node_api.h>
#include <unistd.h>
#define FAIL -1
#define NO_ERR 0
#define ZERO 0

static napi_value Sighold(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    if (valueFirst == NO_ERR) {
        int sig = SIGALRM;
        int sigValue = sighold(sig);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sighold(valueSecond);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigrelse(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    if (valueFirst == NO_ERR) {
        int sig = SIGALRM;
        int sigValue = sigrelse(sig);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sigrelse(valueSecond);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigdelset(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set;
    if (valueFirst == NO_ERR) {
        int sig = SIGINT;
        sigemptyset(&set);
        int sigValue = sigdelset(&set, sig);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        sigemptyset(&set);
        int sigValue = sigdelset(&set, valueSecond);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigaddset(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set;
    if (valueFirst == NO_ERR) {
        int sig = SIGQUIT;
        sigemptyset(&set);
        int sigValue = sigaddset(&set, sig);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        sigemptyset(&set);
        int sigValue = sigaddset(&set, valueSecond);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigemptyset(napi_env env, napi_callback_info info)
{
    sigset_t set;
    int sigValue = sigemptyset(&set);
    napi_value result;
    napi_create_int32(env, sigValue, &result);
    return result;
}

static napi_value Sigfillset(napi_env env, napi_callback_info info)
{
    sigset_t set;
    int sigValue = sigfillset(&set);
    napi_value result;
    napi_create_int32(env, sigValue, &result);
    return result;
}

void SignalHandler(int signum) { kill(getpid(), SIGSTOP); }

static napi_value Sigaction(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    struct sigaction sigabrt = {.sa_handler = SignalHandler};
    if (valueFirst == NO_ERR) {
        int sigValue = sigaction(SIGABRT, &sigabrt, nullptr);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sigaction(valueSecond, &sigabrt, nullptr);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigaltstack(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    stack_t ss;
    ss.ss_size = SIGSTKSZ;
    if (valueFirst == NO_ERR) {
        ss.ss_flags = NO_ERR;
        int sigValue = sigaltstack(&ss, nullptr);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        ss.ss_flags = FAIL;
        int sigValue = sigaltstack(&ss, nullptr);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigignore(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    if (valueFirst == NO_ERR) {
        int sigValue = sigignore(SIGALRM);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sigignore(valueSecond);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
}

static napi_value Sigpause(napi_env env, napi_callback_info info)
{
    int sigValue = sighold(SIGALRM);
    if (sigValue != FAIL || errno != EINTR) {
        napi_value result;
        napi_create_int32(env, FAIL, &result);
        return result;
    } else {
        napi_value result;
        napi_create_int32(env, NO_ERR, &result);
        return result;
    }
}

static napi_value Sigpending(napi_env env, napi_callback_info info)
{
    sigset_t pending;
    int sigValue = sigpending(&pending);
    napi_value result;
    napi_create_int32(env, sigValue, &result);
    return result;
}

static napi_value Sigprocmask(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    sigset_t set, set2;
    if (valueFirst == ZERO) {
        int sigValue = sigprocmask(SIG_UNBLOCK, &set, &set2);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    } else {
        int sigValue = sigprocmask(valueSecond, &set, &set2);
        napi_value result;
        napi_create_int32(env, sigValue, &result);
        return result;
    }
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
    .nm_modname = "signal",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
