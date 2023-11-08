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
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <utmp.h>

#define EXPECTERROR -1
#define ZERO 0

static napi_value Ldiv(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int num, den;
    napi_get_value_int32(env, args[0], &num);
    napi_get_value_int32(env, args[1], &den);

    ldiv_t ret = ldiv(num, den);

    napi_value result = nullptr;
    napi_create_object(env, &result);
    napi_value quot = nullptr;
    napi_value rem = nullptr;
    int a = ret.quot;
    int b = ret.rem;
    napi_create_int32(env, a, &quot);
    napi_set_named_property(env, result, "quot", quot);
    napi_create_int32(env, b, &rem);
    napi_set_named_property(env, result, "rem", rem);

    return result;
}

static napi_value Lcong48(napi_env env, napi_callback_info info)
{
    size_t argc = 7;
    napi_value args[7] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t a;
    uint32_t b;
    uint32_t c;
    uint32_t d;
    uint32_t e;
    uint32_t f;
    uint32_t g;
    napi_get_value_uint32(env, args[0], &a);
    napi_get_value_uint32(env, args[1], &b);
    napi_get_value_uint32(env, args[2], &c);
    napi_get_value_uint32(env, args[3], &d);
    napi_get_value_uint32(env, args[4], &e);
    napi_get_value_uint32(env, args[5], &f);
    napi_get_value_uint32(env, args[6], &g);
    unsigned short xSubFirst[7] = {(unsigned short)a, (unsigned short)b, (unsigned short)c, (unsigned short)d,
                                   (unsigned short)e, (unsigned short)f, (unsigned short)g};
    long randValue = jrand48(xSubFirst);
    napi_value result = nullptr;
    napi_create_int32(env, (int)randValue, &result);

    return result;
}

static napi_value Rand(napi_env env, napi_callback_info info)
{
    int randValue = rand();
    napi_value result = nullptr;
    napi_create_int32(env, randValue, &result);

    return result;
}

static napi_value RandR(napi_env env, napi_callback_info info)
{
    unsigned seed = getpid();
    int randR_value = rand_r(&seed);
    napi_value result = nullptr;
    napi_create_int32(env, randR_value, &result);

    return result;
}

static napi_value Random(napi_env env, napi_callback_info info)
{
    int randomValue = random();

    napi_value result = nullptr;
    napi_create_int32(env, randomValue, &result);

    return result;
}

static napi_value Seed48(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t first;
    uint32_t second;
    uint32_t third;
    napi_get_value_uint32(env, args[0], &first);
    napi_get_value_uint32(env, args[1], &second);
    napi_get_value_uint32(env, args[2], &third);
    unsigned short int *p,
        seedV[3] = {(unsigned short int)first, (unsigned short int)second, (unsigned short int)third};
    p = seed48(seedV);
    napi_value result;
    napi_create_double(env, *p, &result);
    return result;
}
static napi_value Srand(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    if (valueZero == ZERO) {
        int time_value = time(nullptr);
        srand(time_value);
    } else {
        srand(valueZero);
    }
    int sin_value;
    sin_value = rand();
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}
static napi_value Srand48(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    if (valueZero == ZERO) {
        int time_value = time(nullptr);
        srand48(time_value);
    } else {
        srand48(valueZero);
    }
    int sin_value;
    sin_value = rand();
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}
static napi_value Srandom(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    if (valueZero == ZERO) {
        int time_value = time(nullptr);
        srandom(time_value);
    } else {
        srandom(valueZero);
    }
    int sin_value;
    sin_value = rand();
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strtod(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueZero = NapiHelper::GetString(env, args[0]);
    double strtod_value = strtod(valueZero, nullptr);

    napi_value result = nullptr;
    napi_create_double(env, strtod_value, &result);

    return result;
}

static napi_value Strtof(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueZero = NapiHelper::GetString(env, args[0]);
    double strTofValue = strtof(valueZero, nullptr);

    napi_value result = nullptr;
    napi_create_double(env, strTofValue, &result);

    return result;
}

static napi_value Strtol(napi_env env, napi_callback_info info)
{

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTolValue = strtol(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTolValue, &result);

    return result;
}

static napi_value Strtold(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueZero = NapiHelper::GetString(env, args[0]);
    double strToldValue = strtold(valueZero, nullptr);

    napi_value result = nullptr;
    napi_create_double(env, strToldValue, &result);

    return result;
}

static napi_value Strtoll(napi_env env, napi_callback_info info)
{

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTollValue = strtoll(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTollValue, &result);

    return result;
}

static napi_value Strtoul(napi_env env, napi_callback_info info)
{

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTouLValue = strtoul(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTouLValue, &result);

    return result;
}

static napi_value Strtoull(napi_env env, napi_callback_info info)
{

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTouLlValue = strtoull(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTouLlValue, &result);

    return result;
}

static napi_value Setenv(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *value2 = NapiHelper::GetString(env, args[1]);
    int value3;
    napi_get_value_int32(env, args[2], &value3);
    int setValue = setenv(valueFirst, value2, value3);
    napi_value result;
    napi_create_int32(env, setValue, &result);
    return result;
}
static napi_value GetLoadAvg(napi_env env, napi_callback_info info)
{
    double avgs[3];
    int getInfo = getloadavg(avgs, 3);

    napi_value result = nullptr;
    napi_create_double(env, getInfo, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"rand", nullptr, Rand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"randR", nullptr, RandR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"random", nullptr, Random, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seed48", nullptr, Seed48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"srand", nullptr, Srand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"srand48", nullptr, Srand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"srandom", nullptr, Srandom, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtod", nullptr, Strtod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtof", nullptr, Strtof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtol", nullptr, Strtol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtold", nullptr, Strtold, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoll", nullptr, Strtoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoul", nullptr, Strtoul, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoull", nullptr, Strtoull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lcong48", nullptr, Lcong48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ldiv", nullptr, Ldiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setenv", nullptr, Setenv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLoadAvg", nullptr, GetLoadAvg, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "stdlib",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
