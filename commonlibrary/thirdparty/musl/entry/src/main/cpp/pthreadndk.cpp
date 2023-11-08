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
#include <csignal>
#include <cstdlib>
#include <ctime>
#include <pthread.h>
#include <sys/time.h>
#include <unistd.h>

#define ATTR_INIT_FAIL -99
#define ATTR_SETSTACK_FAIL -98
#define BARRIER_INIT_FAIL -97
#define CREATE_ERROR -96
#define JOIN_ERROR -95
#define BARRIERATTR_INIT_FAIL -94
#define CONDATTR_INIT_FAIL -93
#define KEY_CREATE_ERROR -92
#define LOCK_FAIL -91
#define RWLOCK_INIT_ERROR -90
#define RWLOCK_RDLOCK_ERROR -89
#define RWLOCKATTR_INIT_ERROR -88
#define PAGE_SIZE_GET_FAIL -87
#define MEMALIGN_ERROR -86
#define EQUAL_RES 1
#define ERROR -1
#define NORMAL 0
#define TRUE 1
#define ZERO 0
#define ONE 1
#define DEFAULTVALUE -100

#define STACK_SIZE 4096
#define THREADNUM 1
#define thousand 1000
#define THREAD_STACK_LEN 0x4001
#define GUARDSIZE 128
#define BARRIERNUM 1
#define SLEEPTIME 1

static int intInput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int expect;
    napi_get_value_int32(env, args[0], &expect);
    return expect;
}
static napi_value intOutput(napi_env env, int output)
{
    napi_value result;
    napi_create_int32(env, output, &result);
    return result;
}
static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
static void prepare() { pthread_mutex_lock(&lock); }
static void parent() { pthread_mutex_unlock(&lock); }
static void child() { pthread_mutex_unlock(&lock); }
static int testAtFork(int input)
{
    int err = DEFAULTVALUE;
    if (input == NORMAL) {
        err = pthread_atfork(prepare, parent, child);
    }
    return err;
}
static int testAttrDestory(int input)
{
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_destroy(&attr);
    }
    return err;
}
static napi_value PThreadAtFork(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAtFork(input);
    return intOutput(env, result);
}
static napi_value PThreadAttrDestory(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrDestory(input);
    return intOutput(env, result);
}
static int testAttrGetDetachState(int input)
{
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    int state = ZERO;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getdetachstate(&attr, &state);
    }
    return err;
}
static napi_value PThreadAttrGetDetachState(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetDetachState(input);
    return intOutput(env, result);
}
static int testAttrGetGuardSize(int input)
{
    size_t size = ZERO;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getguardsize(&attr, &size);
    }
    return err;
}
// pthread_attr_getguardsize
static napi_value PThreadAttrGetGuardSize(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetGuardSize(input);
    return intOutput(env, result);
}
static int testAttrGetInheritSched(int input)
{
    int result = ERROR;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getinheritsched(&attr, &result);
    }
    return err;
}
static napi_value PThreadAttrGetInheritSched(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetInheritSched(input);
    return intOutput(env, result);
}
static int testAttrGetSchedParam(int input)
{
    struct sched_param getparam;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getschedparam(&attr, &getparam);
    }
    return err;
}
static napi_value PThreadAttrGetSchedParam(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetSchedParam(input);
    return intOutput(env, result);
}
static int testAttrGetSchedPolicy(int input)
{
    int getpolicy = ZERO;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getschedpolicy(&attr, &getpolicy);
    }
    return err;
}
static napi_value PThreadAttrGetSchedPolicy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetSchedPolicy(input);
    return intOutput(env, result);
}
static int testAttrGetScope(int input)
{
    int getscope = ZERO;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getscope(&attr, &getscope);
    }
    return err;
}
static napi_value PThreadAttrGetScope(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetScope(input);
    return intOutput(env, result);
}
static int testAttrGetStack(int input)
{
    void *stack = nullptr;
    size_t stacksize;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setstack(&attr, stack, STACK_SIZE);
        if (err != NORMAL) {
            return ATTR_SETSTACK_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getstack(&attr, &stack, &stacksize);
    }
    return err;
}
static napi_value PThreadAttrGetStack(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetStack(input);
    return intOutput(env, result);
}
static int testAttrGetStackSize(int input)
{
    size_t stacksize = ZERO;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_getstacksize(&attr, &stacksize);
    }
    return err;
}
static napi_value PThreadAttrGetStackSize(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrGetStackSize(input);
    return intOutput(env, result);
}
static int testAttrInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
    }
    return err;
}
static napi_value PThreadAttrInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrInit(input);
    return intOutput(env, result);
}
static int testAttrSetDetachState(int input)
{
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
    }
    return err;
}
static napi_value PThreadAttrSetDetachState(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetDetachState(input);
    return intOutput(env, result);
}
static int testAttrSetGuardSize(int input)
{
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    size_t guardSize = GUARDSIZE;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setguardsize(&attr, guardSize);
    }
    return err;
}
static napi_value PThreadAttrSetGuardSize(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetGuardSize(input);
    return intOutput(env, result);
}
static int testAttrSetInheritSched(int input)
{
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setinheritsched(&attr, PTHREAD_INHERIT_SCHED);
    }
    return err;
}
static napi_value PThreadAttrSetInheritSched(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetInheritSched(input);
    return intOutput(env, result);
}
static int testAttrSetSchedParam(int input)
{
    struct sched_param setparam;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setschedparam(&attr, &setparam);
    }
    return err;
}
static napi_value PThreadAttrSetSchedParam(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetSchedParam(input);
    return intOutput(env, result);
}
static int testAttrSetSchedPolicy(int input)
{
    int setpolicy = TRUE;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setschedpolicy(&attr, setpolicy);
    }
    return err;
}
static napi_value PThreadAttrSetSchedPolicy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetSchedPolicy(input);
    return intOutput(env, result);
}
static int testAttrSetScope(int input)
{
    size_t scope = NORMAL;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setscope(&attr, scope);
    }
    return err;
}
static napi_value PThreadAttrSetScope(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetScope(input);
    return intOutput(env, result);
}
static int testAttrSetStack(int input)
{
    size_t stacksize = STACK_SIZE;
    void *stackAddr = nullptr;

    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    int pageSize = getpagesize();
    if (pageSize == ZERO) {
        return PAGE_SIZE_GET_FAIL;
    }
    if (input == NORMAL) {
        int ret = posix_memalign(&stackAddr, pageSize, THREAD_STACK_LEN);
        if (ret != ZERO) {
            return MEMALIGN_ERROR;
        }
        err = pthread_attr_setstack(&attr, stackAddr, stacksize);
    }
    return err;
}
static napi_value PThreadAttrSetStack(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetStack(input);
    return intOutput(env, result);
}
static int testAttrSetStackSize(int input)
{
    size_t stacksize = STACK_SIZE;
    int err = DEFAULTVALUE;
    pthread_attr_t attr;
    if (input == NORMAL) {
        err = pthread_attr_init(&attr);
        if (err != NORMAL) {
            return ATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_attr_setstacksize(&attr, stacksize);
    }
    return err;
}
static napi_value PThreadAttrSetStackSize(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testAttrSetStackSize(input);
    return intOutput(env, result);
}
static int testBarrierInit(int input)
{
    unsigned int baInt = BARRIERNUM;
    int err = DEFAULTVALUE;
    pthread_barrier_t barrierT;
    pthread_barrierattr_t barrierAttr;
    if (input == NORMAL) {
        err = pthread_barrier_init(&barrierT, &barrierAttr, baInt);
    }
    return err;
}
static napi_value PThreadBarrierInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierInit(input);
    return intOutput(env, result);
}
static int testBarrierDestroy(int input)
{
    unsigned int baInt = BARRIERNUM;
    int err = DEFAULTVALUE;
    pthread_barrier_t barrierT;
    pthread_barrierattr_t barrierAttr;
    if (input == NORMAL) {
        err = pthread_barrier_init(&barrierT, &barrierAttr, baInt);
        if (err != NORMAL) {
            return BARRIER_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_barrier_destroy(&barrierT);
    }
    return err;
}
static napi_value PThreadBarrierDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierDestroy(input);
    return intOutput(env, result);
}
pthread_barrier_t WaitBarrier;
static void *threadFunc(void *)
{
    pthread_barrier_wait(&WaitBarrier);
    return nullptr;
}
static int testBarrierWait(int input)
{
    int err = DEFAULTVALUE;
    pthread_t ids[THREADNUM];
    if (input == NORMAL) {
        err = pthread_barrier_init(&WaitBarrier, nullptr, THREADNUM + BARRIERNUM);
        if (err != NORMAL) {
            return BARRIER_INIT_FAIL;
        }
    }
    for (int i = ZERO; i < THREADNUM; i++) {
        err = pthread_create((pthread_t *)(&(ids[i])), nullptr, threadFunc, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
    }
    int barrierErr = pthread_barrier_wait(&WaitBarrier);
    for (int i = ZERO; i < THREADNUM; i++) {
        err = pthread_join(ids[i], (void **)nullptr);
        if (err != NORMAL) {
            return JOIN_ERROR;
        }
    }
    if (input == NORMAL) {
        err = pthread_barrier_destroy(&WaitBarrier);
    }
    return barrierErr;
}
static napi_value PThreadBarrierWait(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierWait(input);
    return intOutput(env, result);
}
static int testBarrierAttrInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_barrierattr_t barrierAttr;
    if (input == NORMAL) {
        err = pthread_barrierattr_init(&barrierAttr);
    }
    return err;
}
static napi_value PThreadBarrierAttrInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierAttrInit(input);
    return intOutput(env, result);
}
static int testBarrierAttrGetPShared(int input)
{
    int err = DEFAULTVALUE;
    pthread_barrierattr_t barrierAttr;
    int shared = ZERO;
    if (input == NORMAL) {
        err = pthread_barrierattr_init(&barrierAttr);
        if (err != NORMAL) {
            return BARRIERATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_barrierattr_getpshared(&barrierAttr, &shared);
    }
    return err;
}
static napi_value PThreadBarrierAttrGetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierAttrGetPShared(input);
    return intOutput(env, result);
}
static int testBarrierAttrDestroy(int input)
{
    int err = DEFAULTVALUE;
    pthread_barrierattr_t barrierAttr;
    if (input == NORMAL) {
        err = pthread_barrierattr_init(&barrierAttr);
        if (err != NORMAL) {
            return BARRIERATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_barrierattr_destroy(&barrierAttr);
    }
    return err;
}
static napi_value PThreadBarrierAttrDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierAttrDestroy(input);
    return intOutput(env, result);
}
static int testBarrierAttrSetPShared(int input)
{
    int err = DEFAULTVALUE;
    pthread_barrierattr_t barrierAttr;
    int shared = ZERO;
    if (input == NORMAL) {
        err = pthread_barrierattr_init(&barrierAttr);
        if (err != NORMAL) {
            return BARRIERATTR_INIT_FAIL;
        }
    }
    if (input == NORMAL) {
        err = pthread_barrierattr_setpshared(&barrierAttr, shared);
    }
    return err;
}
static napi_value PThreadBarrierAttrSetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testBarrierAttrSetPShared(input);
    return intOutput(env, result);
}
static int testCondInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_cond_t condT;
    pthread_condattr_t condAttr;

    if (input == NORMAL) {
        err = pthread_cond_init(&condT, &condAttr);
    }
    return err;
}
static napi_value PThreadCondInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondInit(input);
    return intOutput(env, result);
}
static int testCondDestory(int input)
{
    int err = DEFAULTVALUE;
    pthread_cond_t condT;
    pthread_condattr_t condAttr;

    if (input == NORMAL) {
        err = pthread_cond_init(&condT, &condAttr);
        err = pthread_cond_destroy(&condT);
    }
    return err;
}
static napi_value PThreadCondDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondDestory(input);
    return intOutput(env, result);
}
static int testCondBroadcast(int input)
{
    int err = DEFAULTVALUE;
    pthread_cond_t condT;
    if (input == NORMAL) {
        err = pthread_cond_broadcast(&condT);
    }
    return err;
}
static napi_value PThreadCondBroadcast(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondBroadcast(input);
    return intOutput(env, result);
}
static int testCondSignal(int input)
{
    int err = DEFAULTVALUE;
    pthread_cond_t condT;
    if (input == NORMAL) {
        err = pthread_cond_signal(&condT);
    }
    return err;
}
static napi_value PThreadCondSignal(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondSignal(input);
    return intOutput(env, result);
}
pthread_cond_t condTestCondWait;
pthread_cond_t condT;
static void *threadFunc2(void *)
{
    sleep(SLEEPTIME);
    pthread_cond_broadcast(&condTestCondWait);
    return nullptr;
}

static int testCondWait(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pid;
    if (input == NORMAL) {
        err = pthread_create(&pid, nullptr, threadFunc2, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        static pthread_mutex_t gmutex;
        pthread_mutex_lock(&gmutex);
        err = pthread_cond_wait(&condTestCondWait, &gmutex);
    }
    return err;
}
static napi_value PThreadCondWait(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondWait(input);
    return intOutput(env, result);
}
static int testCondAttrInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_condattr_t condAttr;
    if (input == NORMAL) {
        err = pthread_condattr_init(&condAttr);
    }
    return err;
}
static napi_value PThreadCondAttrInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondAttrInit(input);
    return intOutput(env, result);
}
static int testCondAttrDestroy(int input)
{
    int err = DEFAULTVALUE;
    pthread_condattr_t condAttr;
    if (input == NORMAL) {
        err = pthread_condattr_init(&condAttr);
        if (err != NORMAL) {
            return CONDATTR_INIT_FAIL;
        }
        err = pthread_condattr_destroy(&condAttr);
    }
    return err;
}
static napi_value PThreadCondAttrDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondAttrDestroy(input);
    return intOutput(env, result);
}
static int testCondAttrGetClock(int input)
{
    int err = DEFAULTVALUE;
    pthread_condattr_t condAttr;
    clockid_t clockid;
    if (input == NORMAL) {
        err = pthread_condattr_init(&condAttr);
        if (err != NORMAL) {
            return CONDATTR_INIT_FAIL;
        }
        err = pthread_condattr_getclock(&condAttr, &clockid);
    }
    return err;
}
static napi_value PThreadCondAttrGetClock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondAttrGetClock(input);
    return intOutput(env, result);
}
static int testCondAttrGetPShared(int input)
{
    int err = DEFAULTVALUE;
    pthread_condattr_t condAttr;
    int shared;
    if (input == NORMAL) {
        err = pthread_condattr_init(&condAttr);
        if (err != NORMAL) {
            return CONDATTR_INIT_FAIL;
        }
        err = pthread_condattr_getpshared(&condAttr, &shared);
    }
    return err;
}
static napi_value PThreadCondAttrGetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondAttrGetPShared(input);
    return intOutput(env, result);
}
static int testCondAttrSetClock(int input)
{
    int err = DEFAULTVALUE;
    pthread_condattr_t condAttr;
    clockid_t clockid = CLOCK_MONOTONIC;
    if (input == NORMAL) {
        err = pthread_condattr_init(&condAttr);
        if (err != NORMAL) {
            return CONDATTR_INIT_FAIL;
        }
        err = pthread_condattr_setclock(&condAttr, clockid);
    }
    return err;
}
static napi_value PThreadCondAttrSetClock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondAttrSetClock(input);
    return intOutput(env, result);
}
static int testCondAttrSetPShared(int input)
{
    int err = DEFAULTVALUE;
    pthread_condattr_t condAttr;
    int shared = TRUE;
    if (input == NORMAL) {
        err = pthread_condattr_init(&condAttr);
        if (err != NORMAL) {
            return CONDATTR_INIT_FAIL;
        }
        err = pthread_condattr_setpshared(&condAttr, shared);
    }
    return err;
}
static napi_value PThreadCondAttrSetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCondAttrSetPShared(input);
    return intOutput(env, result);
}
static void *threadFunc3(void *) { return nullptr; }
static int testCreate(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pid;
    if (input == NORMAL) {
        err = pthread_create(&pid, nullptr, threadFunc3, nullptr);
    }
    return err;
}
static napi_value PThreadCreate(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testCreate(input);
    return intOutput(env, result);
}
static int testDetach(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pid;
    if (input == NORMAL) {
        err = pthread_create(&pid, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_detach(pid);
    }
    return err;
}
static napi_value PThreadDetach(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testDetach(input);
    return intOutput(env, result);
}

static int testEqual(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pid;
    if (input == NORMAL) {
        err = pthread_create(&pid, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_equal(pid, pid);
        if (err != NORMAL) {
            return EQUAL_RES;
        }
    }
    return err;
}
static napi_value PThreadEqual(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testEqual(input);
    return intOutput(env, result);
}
static int testEqual2(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    pthread_t pidsecond;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_create(&pidsecond, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_equal(pidFirst, pidsecond);
    }
    return err;
}
static napi_value PThreadEqual2(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testEqual2(input);
    return intOutput(env, result);
}
int exitOne = ZERO;
static void *threadFunc4(void *) { pthread_exit(&exitOne); }
static int testExit(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    void *pThreadResult;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc4, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_join(pidFirst, &pThreadResult);
    }
    return err;
}
static napi_value PThreadExit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testExit(input);
    return intOutput(env, result);
}
static int testGetAttrNp(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    pthread_attr_t pthreadAttr;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_getattr_np(pidFirst, &pthreadAttr);
    }
    return err;
}
static napi_value PThreadGetAttrNp(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testGetAttrNp(input);
    return intOutput(env, result);
}
static int testGetCpuClockId(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    clockid_t clockid;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_getcpuclockid(pidFirst, &clockid);
    }
    return err;
}
static napi_value PThreadGetCpuClockId(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testGetCpuClockId(input);
    return intOutput(env, result);
}
static int testGetSchedParam(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    int policy;
    struct sched_param schedParam;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_getschedparam(pidFirst, &policy, &schedParam);
    }
    return err;
}
static napi_value PThreadGetSchedParam(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testGetSchedParam(input);
    return intOutput(env, result);
}
static pthread_key_t testGetSpecificKey;
int32_t *keyRet;
int keyRes;
void *threadFuncA(void *)
{
    int value = ZERO;
    pthread_setspecific(testGetSpecificKey, &value);
    keyRet = (int *)pthread_getspecific(testGetSpecificKey);
    keyRes = *keyRet;
    pthread_exit(&keyRes);
}
static int testGetSpecific(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    void *pThreadResult = nullptr;
    if (input == NORMAL) {
        err = pthread_key_create(&testGetSpecificKey, nullptr);
        if (err != NORMAL) {
            return KEY_CREATE_ERROR;
        }
        err = pthread_create(&pidFirst, nullptr, threadFuncA, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        pthread_join(pidFirst, &pThreadResult);
    }
    return *(int32_t *)pThreadResult;
}
static napi_value PThreadGetSpecific(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testGetSpecific(input);
    return intOutput(env, result);
}
static int testJoin(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFuncA, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_join(pidFirst, nullptr);
    }
    return err;
}
static napi_value PThreadJoin(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testJoin(input);
    return intOutput(env, result);
}
static int testKeyCreate(int input)
{
    int err = DEFAULTVALUE;
    if (input == NORMAL) {
        err = pthread_key_create(&testGetSpecificKey, nullptr);
    }
    return err;
}
static napi_value PThreadKeyCreate(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testKeyCreate(input);
    return intOutput(env, result);
}
static int testKeyDelete(int input)
{
    int err = DEFAULTVALUE;
    if (input == NORMAL) {
        err = pthread_key_create(&testGetSpecificKey, nullptr);
        if (err != NORMAL) {
            return KEY_CREATE_ERROR;
        }
        err = pthread_key_delete(testGetSpecificKey);
    }
    return err;
}
static napi_value PThreadKeyDelete(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testKeyDelete(input);
    return intOutput(env, result);
}
static void *threadFunc5(void *)
{
    sleep(SLEEPTIME);
    return nullptr;
}

static int testKill(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc5, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_kill(pidFirst, ZERO);
    }
    return err;
}
static napi_value PThreadKill(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testKill(input);
    return intOutput(env, result);
}
static int testMutexInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutex_t mutexOne;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutex_init(&mutexOne, &mutexAttr);
    }
    return err;
}
static napi_value PThreadMutexInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexInit(input);
    return intOutput(env, result);
}
static int testMutexDestroy(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutex_t mutexOne;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutex_init(&mutexOne, &mutexAttr);
    }
    err = pthread_mutex_destroy(&mutexOne);
    return err;
}
static napi_value PThreadMutexDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexDestroy(input);
    return intOutput(env, result);
}
static int testMutexLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutex_t mutexOne;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutex_init(&mutexOne, &mutexAttr);
    }
    err = pthread_mutex_lock(&mutexOne);
    return err;
}
static napi_value PThreadMutexLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexLock(input);
    return intOutput(env, result);
}
static int testMutexTimedLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutex_t mutexOne;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutex_init(&mutexOne, &mutexAttr);
    }
    struct timeval now;
    struct timespec outTime;
    outTime.tv_sec = now.tv_sec + SLEEPTIME;
    outTime.tv_nsec = now.tv_usec * thousand;
    err = pthread_mutex_timedlock(&mutexOne, &outTime);
    return err;
}
static napi_value PThreadMutexTimedLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexTimedLock(input);
    return intOutput(env, result);
}
static int testMutexTryLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutex_t mutexOne;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutex_init(&mutexOne, &mutexAttr);
    }
    err = pthread_mutex_trylock(&mutexOne);
    return err;
}
static napi_value PThreadMutexTryLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexTryLock(input);
    return intOutput(env, result);
}
static int testMutexUnLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutex_t mutexOne;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutex_init(&mutexOne, &mutexAttr);
    }
    err = pthread_mutex_lock(&mutexOne);
    if (err != NORMAL) {
        return LOCK_FAIL;
    }
    err = pthread_mutex_unlock(&mutexOne);
    return err;
}
static napi_value PThreadMutexUnLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexUnLock(input);
    return intOutput(env, result);
}
static int testMutexAttrDestroy(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_destroy(&mutexAttr);
    return err;
}
static napi_value PThreadMutexAttrDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrDestroy(input);
    return intOutput(env, result);
}
static int testMutexAttrGetProtocol(int input)
{
    int err = DEFAULTVALUE;
    int protocol;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_getprotocol(&mutexAttr, &protocol);
    return err;
}
static napi_value PThreadMutexAttrGetProtocol(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrGetProtocol(input);
    return intOutput(env, result);
}
static int testMutexAttrGetPshared(int input)
{
    int err = DEFAULTVALUE;
    int share;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_getpshared(&mutexAttr, &share);
    return err;
}
static napi_value PThreadMutexAttrGetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrGetPshared(input);
    return intOutput(env, result);
}
static int testMutexAttrGetType(int input)
{
    int err = DEFAULTVALUE;
    int type;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_gettype(&mutexAttr, &type);
    return err;
}
static napi_value PThreadMutexAttrGetType(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrGetType(input);
    return intOutput(env, result);
}
static int testMutexAttrInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
    }
    return err;
}
static napi_value PThreadMutexAttrInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrInit(input);
    return intOutput(env, result);
}
static int testMutexAttrSetProtocol(int input)
{
    int err = DEFAULTVALUE;
    int protocol = ZERO;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_setprotocol(&mutexAttr, protocol);
    return err;
}
static napi_value PThreadMutexAttrSetProtocol(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrSetProtocol(input);
    return intOutput(env, result);
}
static int testMutexAttrSetPshared(int input)
{
    int err = DEFAULTVALUE;
    int share = ZERO;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_setpshared(&mutexAttr, share);
    return err;
}
static napi_value PThreadMutexAttrSetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrSetPshared(input);
    return intOutput(env, result);
}
static int testMutexAttrSetType(int input)
{
    int err = DEFAULTVALUE;
    int type = ZERO;
    pthread_mutexattr_t mutexAttr;
    if (input == NORMAL) {
        err = pthread_mutexattr_init(&mutexAttr);
        if (err != NORMAL) {
            return LOCK_FAIL;
        }
    }
    err = pthread_mutexattr_settype(&mutexAttr, type);
    return err;
}
static napi_value PThreadMutexAttrSetType(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testMutexAttrSetType(input);
    return intOutput(env, result);
}
pthread_once_t once = PTHREAD_ONCE_INIT;
void once_run(void)
{
    int i = ZERO;
    i = i + 1;
}
int pThreadOnceRet;
void *threadfunc5(void *)
{
    pThreadOnceRet = pthread_once(&once, once_run);
    pthread_exit(&pThreadOnceRet);
}
static int testOnce(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    void *pThreadResult = nullptr;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadfunc5, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        pthread_join(pidFirst, &pThreadResult);
    }
    return *(int *)pThreadResult;
}
static napi_value PThreadOnce(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testOnce(input);
    return intOutput(env, result);
}
static int testRwLockInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
    }
    return err;
}
static napi_value PThreadRwLockInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockInit(input);
    return intOutput(env, result);
}
static int testRwLockDestroy(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_destroy(&rwLock);
    }
    return err;
}
static napi_value PThreadRwLockDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockDestroy(input);
    return intOutput(env, result);
}
static int testRwLockRdLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_rdlock(&rwLock);
    }
    return err;
}
static napi_value PThreadRwLockRdLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockRdLock(input);
    return intOutput(env, result);
}
static int testRwLockTimedRdLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    struct timeval now;
    struct timespec outTime;
    gettimeofday(&now, nullptr);
    outTime.tv_sec = now.tv_sec + SLEEPTIME;
    outTime.tv_nsec = now.tv_usec * thousand;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_timedrdlock(&rwLock, &outTime);
    }
    return err;
}
static napi_value PThreadRwLockTimedRdLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockTimedRdLock(input);
    return intOutput(env, result);
}
static int testRwLockTimedWrLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    struct timeval now;
    struct timespec outTime;
    gettimeofday(&now, nullptr);
    outTime.tv_sec = now.tv_sec + SLEEPTIME;
    outTime.tv_nsec = now.tv_usec * thousand;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_timedwrlock(&rwLock, &outTime);
    }
    return err;
}
static napi_value PThreadRwLockTimedWrLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockTimedWrLock(input);
    return intOutput(env, result);
}
static int testRwLockTryRdLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_tryrdlock(&rwLock);
    }
    return err;
}
static napi_value PThreadRwLockTryRdLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockTryRdLock(input);
    return intOutput(env, result);
}
static int testRwLockTryWrLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_trywrlock(&rwLock);
    }
    return err;
}
static napi_value PThreadRwLockTryWrLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockTryWrLock(input);
    return intOutput(env, result);
}
static int testRwLockUnLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_rdlock(&rwLock);
        if (err != NORMAL) {
            return RWLOCK_RDLOCK_ERROR;
        }
        err = pthread_rwlock_unlock(&rwLock);
    }
    return err;
}
static napi_value PThreadRwLockUnLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockUnLock(input);
    return intOutput(env, result);
}
static int testRwLockWrLock(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlock_t rwLock;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlock_init(&rwLock, &rwLockAttr);
        if (err != NORMAL) {
            return RWLOCK_INIT_ERROR;
        }
        err = pthread_rwlock_wrlock(&rwLock);
    }
    return err;
}
static napi_value PThreadRwLockWrLock(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockWrLock(input);
    return intOutput(env, result);
}
static int testRwLockAttrDestroy(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlockattr_init(&rwLockAttr);
        if (err != NORMAL) {
            return RWLOCKATTR_INIT_ERROR;
        }
        err = pthread_rwlockattr_destroy(&rwLockAttr);
    }
    return err;
}
static napi_value PThreadRwLockAttrDestroy(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockAttrDestroy(input);
    return intOutput(env, result);
}
static int testRwLockAttrGetPShared(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlockattr_t rwLockAttr;
    int shared;
    if (input == NORMAL) {
        err = pthread_rwlockattr_init(&rwLockAttr);
        if (err != NORMAL) {
            return RWLOCKATTR_INIT_ERROR;
        }
        err = pthread_rwlockattr_getpshared(&rwLockAttr, &shared);
    }
    return err;
}
static napi_value PThreadRwLockAttrGetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockAttrGetPShared(input);
    return intOutput(env, result);
}
static int testRwLockAttrInit(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlockattr_t rwLockAttr;
    if (input == NORMAL) {
        err = pthread_rwlockattr_init(&rwLockAttr);
    }
    return err;
}
static napi_value PThreadRwLockAttrInit(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockAttrInit(input);
    return intOutput(env, result);
}
static int testRwLockAttrSetPShared(int input)
{
    int err = DEFAULTVALUE;
    pthread_rwlockattr_t rwLockAttr;
    int shared = ZERO;
    if (input == NORMAL) {
        err = pthread_rwlockattr_init(&rwLockAttr);
        if (err != NORMAL) {
            return RWLOCKATTR_INIT_ERROR;
        }
        err = pthread_rwlockattr_setpshared(&rwLockAttr, shared);
    }
    return err;
}
static napi_value PThreadRwLockAttrSetPShared(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testRwLockAttrSetPShared(input);
    return intOutput(env, result);
}
static int testSelf(int input)
{
    int err = DEFAULTVALUE;
    if (input == NORMAL) {
        pthread_t pid = pthread_self();
        if (pid > NORMAL) {
            err = NORMAL;
        } else {
            err = ERROR;
        }
    }
    return err;
}
static napi_value PThreadSelf(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testSelf(input);
    return intOutput(env, result);
}
static int testSetNameNp(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    char setName[20] = "pSet";
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_setname_np(pidFirst, setName);
    }
    return err;
}
static napi_value PThreadSetNameNp(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testSetNameNp(input);
    return intOutput(env, result);
}
static int testSetSchedParam(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    struct sched_param schedParam;
    schedParam.sched_priority = ZERO;

    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_setschedparam(pidFirst, SCHED_OTHER, &schedParam);
    }
    return err;
}
static napi_value PThreadSetSchedParam(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testSetSchedParam(input);
    return intOutput(env, result);
}
static int testSetSchedPrio(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    int prio = ZERO;
    if (input == NORMAL) {
        err = pthread_create(&pidFirst, nullptr, threadFunc3, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        err = pthread_setschedprio(pidFirst, prio);
    }
    return err;
}
static napi_value PThreadSetSchedPrio(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testSetSchedPrio(input);
    return intOutput(env, result);
}
static pthread_key_t testSetSpecificKey;
int setSpecRet = DEFAULTVALUE;
void *threadfuncB(void *)
{
    int32_t value = ZERO;
    setSpecRet = pthread_setspecific(testSetSpecificKey, &value);
    pthread_exit(&setSpecRet);
}
static int testSetSpecific(int input)
{
    int err = DEFAULTVALUE;
    pthread_t pidFirst;
    void *pThreadResult = nullptr;
    if (input == NORMAL) {
        err = pthread_key_create(&testSetSpecificKey, nullptr);
        if (err != NORMAL) {
            return KEY_CREATE_ERROR;
        }
        err = pthread_create(&pidFirst, nullptr, threadfuncB, nullptr);
        if (err != NORMAL) {
            return CREATE_ERROR;
        }
        pthread_join(pidFirst, &pThreadResult);
        pthread_key_delete(testSetSpecificKey);
    }
    return *(int *)pThreadResult;
}
static napi_value PThreadSetSpecific(napi_env env, napi_callback_info info)
{
    int input = intInput(env, info);
    int result = testSetSpecific(input);
    return intOutput(env, result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"pThreadAtFork", nullptr, PThreadAtFork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrDestory", nullptr, PThreadAttrDestory, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetDetachState", nullptr, PThreadAttrGetDetachState, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetGuardSize", nullptr, PThreadAttrGetGuardSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetInheritSched", nullptr, PThreadAttrGetInheritSched, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetSchedParam", nullptr, PThreadAttrGetSchedParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetSchedPolicy", nullptr, PThreadAttrGetSchedPolicy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetScope", nullptr, PThreadAttrGetScope, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetStack", nullptr, PThreadAttrGetStack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetStackSize", nullptr, PThreadAttrGetStackSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrInit", nullptr, PThreadAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetDetachState", nullptr, PThreadAttrSetDetachState, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetGuardSize", nullptr, PThreadAttrSetGuardSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetInheritSched", nullptr, PThreadAttrSetInheritSched, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetSchedParam", nullptr, PThreadAttrSetSchedParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetSchedPolicy", nullptr, PThreadAttrSetSchedPolicy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetScope", nullptr, PThreadAttrSetScope, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetStack", nullptr, PThreadAttrSetStack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetStackSize", nullptr, PThreadAttrSetStackSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierInit", nullptr, PThreadBarrierInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierDestroy", nullptr, PThreadBarrierDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierWait", nullptr, PThreadBarrierWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierAttrInit", nullptr, PThreadBarrierAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierAttrGetPShared", nullptr, PThreadBarrierAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadBarrierAttrDestroy", nullptr, PThreadBarrierAttrDestroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadBarrierAttrSetPShared", nullptr, PThreadBarrierAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadCondInit", nullptr, PThreadCondInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondDestroy", nullptr, PThreadCondDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondBroadcast", nullptr, PThreadCondBroadcast, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondSignal", nullptr, PThreadCondSignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondWait", nullptr, PThreadCondWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrInit", nullptr, PThreadCondAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrDestroy", nullptr, PThreadCondAttrDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrGetClock", nullptr, PThreadCondAttrGetClock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrGetPShared", nullptr, PThreadCondAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadCondAttrSetClock", nullptr, PThreadCondAttrSetClock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrSetPShared", nullptr, PThreadCondAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadCreate", nullptr, PThreadCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadDetach", nullptr, PThreadDetach, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadEqual", nullptr, PThreadEqual, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadEqual2", nullptr, PThreadEqual2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadExit", nullptr, PThreadExit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetAttrNp", nullptr, PThreadGetAttrNp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetCpuClockId", nullptr, PThreadGetCpuClockId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetSchedParam", nullptr, PThreadGetSchedParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetSpecific", nullptr, PThreadGetSpecific, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadJoin", nullptr, PThreadJoin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadKeyCreate", nullptr, PThreadKeyCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadKeyDelete", nullptr, PThreadKeyDelete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadKill", nullptr, PThreadKill, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexInit", nullptr, PThreadMutexInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexDestroy", nullptr, PThreadMutexDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexLock", nullptr, PThreadMutexLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexTimedLock", nullptr, PThreadMutexTimedLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexTryLock", nullptr, PThreadMutexTryLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexUnLock", nullptr, PThreadMutexUnLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrDestroy", nullptr, PThreadMutexAttrDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrGetProtocol", nullptr, PThreadMutexAttrGetProtocol, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrGetPShared", nullptr, PThreadMutexAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrGetType", nullptr, PThreadMutexAttrGetType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrInit", nullptr, PThreadMutexAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrSetProtocol", nullptr, PThreadMutexAttrSetProtocol, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrSetPShared", nullptr, PThreadMutexAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrSetType", nullptr, PThreadMutexAttrSetType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadOnce", nullptr, PThreadOnce, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockInit", nullptr, PThreadRwLockInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockDestroy", nullptr, PThreadRwLockDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockRdLock", nullptr, PThreadRwLockRdLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockTimedRdLock", nullptr, PThreadRwLockTimedRdLock, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockTimedWrLock", nullptr, PThreadRwLockTimedWrLock, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockTryRdLock", nullptr, PThreadRwLockTryRdLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockTryWrLock", nullptr, PThreadRwLockTryWrLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockUnLock", nullptr, PThreadRwLockUnLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockWrLock", nullptr, PThreadRwLockWrLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockAttrDestroy", nullptr, PThreadRwLockAttrDestroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockAttrGetPShared", nullptr, PThreadRwLockAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockAttrInit", nullptr, PThreadRwLockAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockAttrSetPShared", nullptr, PThreadRwLockAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadSelf", nullptr, PThreadSelf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetNameNp", nullptr, PThreadSetNameNp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetSchedParam", nullptr, PThreadSetSchedParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetSchedPrio", nullptr, PThreadSetSchedPrio, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetSpecific", nullptr, PThreadSetSpecific, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "pthread1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
