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
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>
#include <search.h>
#include <unistd.h>


#define PARAM_0 0
#define PARAM_5 5
#define PARAM_27 27
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL -1
#define ERRON_0 0
#define TWICE 12
#define ARRAY_SIZE (10)
#define FAIL -1
#define NOERR 0
#define VALUE_ONE 1
#define VALUE_TWO 1
#define BUFFERSIZE 128
#define LOOPNUM 12
static void *root = nullptr;

static int compare(const void *pa, const void *pb)
{
    if (*(int *)pa < *(int *)pb)
        return PARAM_UNNORMAL;
    if (*(int *)pa > *(int *)pb)
        return 1;
    return 0;
}

static void action(const void *nodep, VISIT which, int depth)
{
    int *datap = nullptr;

    switch (which) {
    case preorder:
        break;
    case postorder:
        datap = *(int **)nodep;
        printf("%6d\n", *datap);
        break;
    case endorder:
        break;
    case leaf:
        datap = *(int **)nodep;
        printf("%6d\n", *datap);
        break;
    }
}

static napi_value Tdestroy(napi_env env, napi_callback_info info)
{
    void * rootParam= nullptr;
    napi_value result = nullptr;
    errno = ERRON_0;
    tdestroy(rootParam, free);
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Tdelete(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    tdelete(root, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Tfind(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    tfind(root, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Hcreate(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    ret = hcreate(BUFSIZ);
    hdestroy();
    napi_value result = nullptr;
    if (ret == NOERR) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static napi_value HcreateR(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    struct hsearch_data h_data = {PARAM_0};
    hcreate_r(BUFSIZ, &h_data);
    hdestroy_r(&h_data);
    napi_value result = nullptr;
    if (ret == NOERR) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static napi_value Hdestroy(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    ret = hcreate(BUFSIZ);
    hdestroy();
    ret = hcreate(BUFSIZ);
    hdestroy();
    napi_value result = nullptr;
    if (ret == NOERR) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static napi_value HdestroyR(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    struct hsearch_data h_data = {PARAM_0};
    memset(&h_data, PARAM_0, sizeof(struct hsearch_data));
    hcreate_r(BUFSIZ, &h_data);
    hdestroy_r(&h_data);
    memset(&h_data, PARAM_0, sizeof(struct hsearch_data));
    ret = hcreate_r(BUFSIZ, &h_data);
    hdestroy_r(&h_data);
    napi_value result = nullptr;
    if (ret == PARAM_0) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static char data[][30] = { "alpha", "bravo", "charlie", "delta",
     "echo", "foxtrot", "golf", "hotel", "india", "juliet",
     "kilo", "lima", "mike", "november", "oscar", "papa",
     "quebec", "romeo", "sierra", "tango", "uniform",
     "victor", "whisky", "x-ray", "yankee", "zulu"
};

static napi_value Hsearch(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    ENTRY e, *ep;
    int i;

    hcreate(30);

    for (i = 0; i < 24; i++) {
        e.key = data[i];
        e.data = (void *) i;
        ep = hsearch(e, ENTER);
        if (ep == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }

    for (i = 22; i < 26; i++) {
        e.key = data[i];
        ep = hsearch(e, FIND);
    }
    hdestroy();
    napi_create_int32(env, NOERR, &result);
    return result;
}

static napi_value HsearchR(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct hsearch_data *htab = (struct hsearch_data *)calloc(1, sizeof(struct hsearch_data));
    if (!htab) {
        printf("calloc fail\n");
        exit(0);
    }

    if (hcreate_r(10, htab) == PARAM_0){
        printf("hcreat_r fail\n");
        exit(0);
    }
    
    char keys[][8] = {"key1", "key2", "key3"};
    char data[][8] = {"yasuo", "kitty", "ruiwen"};

    int i;
    for (i = 0; i < 3; i++){
        ENTRY e, *ep;
        e.key = keys[i];
        e.data = (void *) data[i];
        hsearch_r(e, ENTER, &ep, htab);
    }

    for (i = 0; i < 3; i++){
        ENTRY e2, *ep2;
        e2.key = keys[i];
        hsearch_r(e2, FIND, &ep2, htab);
        if (ep2 != nullptr){
            napi_create_int32(env, NOERR, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }

    hdestroy_r(htab);
    if (htab)free(htab);

    napi_create_int32(env, FAIL, &result);
    return result;
}

struct q {
    struct q *n;
    struct q *p;
    int i;
};

static napi_value Insque(napi_env env, napi_callback_info info)
{
    struct q elem = {PARAM_0};
    insque(&elem, nullptr);
    napi_value result = nullptr;
    if (elem.n == nullptr && elem.p == nullptr) {
        napi_create_int32(env, NOERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

typedef int (*fc)(const void*,const void*);
 
static napi_value LSearch(napi_env env, napi_callback_info info)
{
    int arr[5] = {27, 14, 29, 68, 55};
    size_t n = PARAM_5;
    int key = PARAM_27;
    fc f = compare;
    int *ret = (int *)lsearch(&key, arr, &n, sizeof(int), f);
    napi_value result = nullptr;
    if (ret) {
        napi_create_int32(env, NOERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value Lfind(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int array[3];
    size_t nlength;
    int key = PARAM_0;
    void *ret = nullptr;
    napi_get_value_int32(env, args[0], array);
    napi_get_value_int32(env, args[0], array + VALUE_ONE);
    napi_get_value_int32(env, args[0], array + VALUE_TWO);
    napi_get_value_int32(env, args[0], &key);
    ret = lfind(&key, array, &nlength, sizeof(int), compare);
    napi_value result = nullptr;
    if (ret == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NOERR, &result);
    }
    return result;
}

static napi_value Remque(napi_env env, napi_callback_info info)
{
    errno = NOERR;
    struct q *elem = (struct q *)malloc(sizeof(struct q));
    insque(elem, nullptr);
    remque(elem);
    napi_value result = nullptr;
    if (errno == NOERR) {
        napi_create_int32(env, NOERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

struct stu {
    int stu_no;
    char name[BUFFERSIZE];
};

typedef struct stu stu_t;
int compareStu(const void *pa, const void *pb) { return ((stu_t *)pa)->stu_no - ((stu_t *)pb)->stu_no; }

static napi_value Tsearch(napi_env env, napi_callback_info info)
{
    void *root = nullptr;
    stu_t stuSturct;
    sprintf(stuSturct.name, "shanghai_%d", stuSturct.stu_no);
    stu_t **rtp = (stu_t **)tsearch(&stuSturct, &root, compareStu);
    napi_value result = nullptr;
    if (rtp != nullptr) {
        napi_create_int32(env, NOERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }

    return result;
}

static napi_value Twalk(napi_env env, napi_callback_info info)
{
    int i = PARAM_0, *ptr = nullptr;
    void *val = nullptr;
    void *root = nullptr;
    srand(time(nullptr));
    for (i = 0; i < LOOPNUM; i++) {
        ptr = (int *)malloc(sizeof(int));
        *ptr = rand() & 0xff;
        val = tsearch((void *)ptr, &root, compare);
        if (val == nullptr)
            exit(EXIT_FAILURE);
        else if ((*(int **)val) != ptr)
            free(ptr);
    }
    twalk(root, action);
    tdestroy(root, free);
    napi_value result = nullptr;
    if (nullptr != root) {
        napi_create_int32(env, NOERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"tdestroy", nullptr, Tdestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tdelete", nullptr, Tdelete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tfind", nullptr, Tfind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hcreate", nullptr, Hcreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hcreateR", nullptr, HcreateR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hdestroy", nullptr, Hdestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hdestroyR", nullptr, HdestroyR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hsearch", nullptr, Hsearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hsearchR", nullptr, HsearchR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"insque", nullptr, Insque, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lSearch", nullptr, LSearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lfind", nullptr, Lfind, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remque", nullptr, Remque, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tsearch", nullptr, Tsearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"twalk", nullptr, Twalk, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "search",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
