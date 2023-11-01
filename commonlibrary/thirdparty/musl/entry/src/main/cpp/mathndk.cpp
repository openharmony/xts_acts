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
#include <cmath>
#include <cstdlib>
#define PI 3.14159265358979
#define HALFCIRCLE 180.0
#define ERROR -1
#define ONE 1
#define TWO 2
#define ZERO 0
static napi_value ASin(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asin(valueZero);
    int resultTrue = 1;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        napi_create_double(env, resultTrue, &result);
    } else {
        napi_create_double(env, resultValue, &result);
    }

    return result;
}

static napi_value ASinF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinf(valueZero);
    int resultTrue = 1;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        napi_create_double(env, resultTrue, &result);
    } else {
        napi_create_double(env, resultValue, &result);
    }

    return result;
}

static napi_value ASinL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinl(valueZero);
    int resultTrue = 1;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        napi_create_double(env, resultTrue, &result);
    } else {
        napi_create_double(env, resultValue, &result);
    }

    return result;
}

static napi_value ASinH(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinh(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ASinHF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinhf(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ASinHL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinhl(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACos(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acos(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acosf(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acosl(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosH(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acosh(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosHL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acoshl(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosHF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acoshf(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATan(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = atan(valueZero);
    int resultTrue = 1;
    if (valueZero == -1 || valueZero == 1) {
        if (resultValue <= M_PI_2 && resultValue >= -M_PI_2) {
            napi_create_double(env, resultTrue, &result);
        }
    } else {
        napi_create_double(env, resultValue, &result);
    }
    return result;
}

static napi_value ATanF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = atanf(valueZero);
    int resultTrue = 1;
    if (valueZero == -1 || valueZero == 1) {
        if (resultValue <= M_PI_2 && resultValue >= -M_PI_2) {
            napi_create_double(env, resultTrue, &result);
        }
    } else {
        napi_create_double(env, resultValue, &result);
    }
    return result;
}

static napi_value ATanL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    int resultTrue = 1;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;
    double resultValue = atanl(valueZero);
    if (resultValue <= M_PI_2 && resultValue >= -M_PI_2) {
        napi_create_double(env, resultTrue, &result);
        if (valueZero == INFINITY || valueZero == -INFINITY) {
            napi_create_double(env, resultValue, &result);
        }
    } else {
        napi_create_double(env, resultValue, &result);
    }
    return result;
}

static napi_value ATan2(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    double firstParam;
    napi_get_value_double(env, args[0], &valueZero);
    napi_get_value_double(env, args[1], &firstParam);
    napi_value result = nullptr;

    double resultValue = atan2(valueZero, firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATan2F(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    double firstParam;
    napi_get_value_double(env, args[0], &valueZero);
    napi_get_value_double(env, args[1], &firstParam);
    napi_value result = nullptr;

    double resultValue = atan2f(valueZero, firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATan2L(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    double firstParam;
    napi_get_value_double(env, args[0], &valueZero);
    napi_get_value_double(env, args[1], &firstParam);
    napi_value result = nullptr;

    double resultValue = atan2l(valueZero, firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Fmod(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmod(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMin(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmin(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMax(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmax(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Fma(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    int indexSecond = TWO, indexFirst = ONE, indexZero = ZERO;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[indexZero], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[indexFirst], &secondParam);
    double thirdParam;
    napi_get_value_double(env, args[indexSecond], &thirdParam);
    double getResult = fma(firstParam, secondParam, thirdParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Floor(napi_env env, napi_callback_info info)
{

    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = floor(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FDim(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fdim(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FAbs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = fabs(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CopySignL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = copysignl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CopySignF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = copysignf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CopySign(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = copysign(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Erf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Cos(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cos(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Cosh(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cosh(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp2(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpM1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expm1(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmodF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmodf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmodL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmodl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMinF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fminf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMinL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fminl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMaxF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmaxf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMaxL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmaxl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmaF(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    int indexSecond = TWO, indexFirst = ONE, indexZero = ZERO;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[indexZero], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[indexFirst], &secondParam);
    double thirdParam;
    napi_get_value_double(env, args[indexSecond], &thirdParam);
    double getResult = fmaf(firstParam, secondParam, thirdParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmaL(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    int indexSecond = TWO, indexFirst = ONE, indexZero = ZERO;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[indexZero], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[indexFirst], &secondParam);
    double thirdParam;
    napi_get_value_double(env, args[indexSecond], &thirdParam);
    double getResult = fmal(firstParam, secondParam, thirdParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FloorF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = floorf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FloorL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = floorl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FDimF(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fdimf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FDimL(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fdiml(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FAbsL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = fabsl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FAbsF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    float getV1 = firstParam;
    float getResultf = fabsf(getV1);
    double getResult = getResultf;
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Ceil(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = ceil(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CeilF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = ceilf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CeilL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = ceill(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpM1f(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expm1f(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpM1l(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expm1l(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp2f(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp2f(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp2l(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp2l(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfC(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfc(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfCf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfcf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfCl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfcl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erff(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosF(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cosf(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosL(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cosl(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosHf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = coshf(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosHl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = coshl(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static double doubleInput(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    napi_get_value_double(env, args[0], &expect);
    return expect;
}

static napi_value doubleOutput(napi_env env, double output)
{
    napi_value result;
    napi_create_double(env, output, &result);
    return result;
}

static napi_value Log(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log(input));
}

static napi_value Log10(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log10(input));
}

static napi_value Log10f(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log10f(input));
}

static napi_value Log10l(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log10l(input));
}

static napi_value Log1p(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log1p(input));
}

static napi_value Log1pf(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log1pf(input));
}

static napi_value Log1pl(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log1pl(input);
    return doubleOutput(env, result);
}

static napi_value Log2(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log2(input);
    return doubleOutput(env, result);
}

static napi_value Log2f(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log2(input);
    return doubleOutput(env, result);
}

static napi_value Log2l(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log2(input);
    return doubleOutput(env, result);
}

static napi_value LogB(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logb(input);
    return doubleOutput(env, result);
}

static napi_value LogBf(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logbf(input);
    return doubleOutput(env, result);
}

static napi_value LogBl(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logbf(input);
    return doubleOutput(env, result);
}

static napi_value LogF(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logf(input);
    return doubleOutput(env, result);
}

static napi_value LogL(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logl(input);
    return doubleOutput(env, result);
}

static napi_value Sin(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sin(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sinf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sinf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sinh(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sinh(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sinhf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sinhf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sinhl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sinhl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sinl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sinl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sqrt(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sqrt(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sqrtf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sqrtf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Sqrtl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sin_value = sqrtl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sin_value, &result);
    return result;
}

static napi_value Remainder(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);

    double remainder_value = remainder(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, remainder_value, &result);

    return result;
}

static napi_value Remainderf(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);

    double remainder_value = remainderf(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, remainder_value, &result);

    return result;
}

static napi_value Remainderl(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);

    double remainder_value = remainderl(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, remainder_value, &result);
    return result;
}

static napi_value Remquo(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    int secondParam;
    napi_get_value_int32(env, args[2], &secondParam);

    double remquo_value = remquo(valueZero, firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_double(env, remquo_value, &result);

    return result;
}

static napi_value Remquof(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    int secondParam;
    napi_get_value_int32(env, args[2], &secondParam);

    double remquo_value = remquof(valueZero, firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_double(env, remquo_value, &result);

    return result;
}

static napi_value Remquol(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    int secondParam;
    napi_get_value_int32(env, args[2], &secondParam);

    double remquo_value = remquol(valueZero, firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_double(env, remquo_value, &result);

    return result;
}

static napi_value Rint(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    int rint_value = rint(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, rint_value, &result);

    return result;
}

static napi_value Rintf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double rintf_value = rintf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, rintf_value, &result);

    return result;
}

static napi_value Rintl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double rintl_value = rintl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, rintl_value, &result);

    return result;
}

static napi_value Round(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double round_value = round(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, round_value, &result);

    return result;
}

static napi_value Roundf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double roundf_value = roundf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, roundf_value, &result);

    return result;
}

static napi_value Roundl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double roundl_value = roundl(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, roundl_value, &result);

    return result;
}

static napi_value Scalbln(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    double scalbln_value = scalbln(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, scalbln_value, &result);

    return result;
}

static napi_value Tan(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tan_value = tan(value);
    napi_value result = nullptr;
    napi_create_double(env, tan_value, &result);
    return result;
}

static napi_value Tanf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanf_value = tanf(value);
    napi_value result = nullptr;
    napi_create_double(env, tanf_value, &result);
    return result;
}

static napi_value Tanh(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanh_value = tanh(value);
    napi_value result = nullptr;
    napi_create_double(env, tanh_value, &result);
    return result;
}

static napi_value Tanhf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanhf_value = tanhf(value);
    napi_value result = nullptr;
    napi_create_double(env, tanhf_value, &result);
    return result;
}

static napi_value Tanhl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanhl_value = tanhl(value);
    napi_value result = nullptr;
    napi_create_double(env, tanhl_value, &result);
    return result;
}

static napi_value Tanl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanl_value = tanl(value);
    napi_value result = nullptr;
    napi_create_double(env, tanl_value, &result);
    return result;
}

static napi_value Tgamma(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double tgamma_value = tgamma(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, tgamma_value, &result);
    return result;
}

static napi_value Tgammaf(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double tgammaf_value = tgammaf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, tgammaf_value, &result);
    return result;
}

static napi_value Tgammal(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double tgammal_value = tgammal(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, tgammal_value, &result);
    return result;
}

static napi_value Scalblnl(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int64_t second;
    napi_get_value_int64(env, args[1], &second);
    double value = scalblnl(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalbn(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int second;
    napi_get_value_int32(env, args[1], &second);
    double value = scalbn(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalblnf(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int64_t second;
    napi_get_value_int64(env, args[1], &second);
    double value = scalblnf(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalbnf(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int64_t second;
    napi_get_value_int64(env, args[1], &second);
    double value = scalbnf(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalbnl(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int second;
    napi_get_value_int32(env, args[1], &second);
    double value = scalbnl(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"remainder", nullptr, Remainder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remainderf", nullptr, Remainderf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remainderl", nullptr, Remainderl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remquo", nullptr, Remquo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remquof", nullptr, Remquof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remquol", nullptr, Remquol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rint", nullptr, Rint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rintf", nullptr, Rintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rintl", nullptr, Rintl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"round", nullptr, Round, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"roundl", nullptr, Roundl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"roundf", nullptr, Roundf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbln", nullptr, Scalbln, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tan", nullptr, Tan, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanf", nullptr, Tanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanh", nullptr, Tanh, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanhf", nullptr, Tanhf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanhl", nullptr, Tanhl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanl", nullptr, Tanl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tgamma", nullptr, Tgamma, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tgammaf", nullptr, Tgammaf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tgammal", nullptr, Tgammal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalblnl", nullptr, Scalblnl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbn", nullptr, Scalbn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalblnf", nullptr, Scalblnf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbnf", nullptr, Scalbnf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbnl", nullptr, Scalbnl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log", nullptr, Log, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log10", nullptr, Log10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log10l", nullptr, Log10l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log10f", nullptr, Log10f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log1p", nullptr, Log1p, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log1pf", nullptr, Log1pf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log1pl", nullptr, Log1pl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2", nullptr, Log2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2f", nullptr, Log2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2l", nullptr, Log2l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logB", nullptr, LogB, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logBf", nullptr, LogBf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logBl", nullptr, LogBl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logF", nullptr, LogF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logL", nullptr, LogL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSin", nullptr, ASin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinF", nullptr, ASinF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinL", nullptr, ASinL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinH", nullptr, ASinH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinHL", nullptr, ASinHL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinHF", nullptr, ASinHF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCos", nullptr, ACos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosF", nullptr, ACosF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosL", nullptr, ACosL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosH", nullptr, ACosH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosHL", nullptr, ACosHL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosHF", nullptr, ACosHF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan", nullptr, ATan, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanF", nullptr, ATanF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanL", nullptr, ATanL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan2", nullptr, ATan2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan2F", nullptr, ATan2F, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan2L", nullptr, ATan2L, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"coshl", nullptr, CosHl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"coshf", nullptr, CosHf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cosh", nullptr, Cosh, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cosl", nullptr, CosL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cosf", nullptr, CosF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfl", nullptr, ErfL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erff", nullptr, ErfF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfcl", nullptr, ErfCl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfcf", nullptr, ErfCf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfc", nullptr, ErfC, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2l", nullptr, Exp2l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2f", nullptr, Exp2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expl", nullptr, ExpL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expf", nullptr, ExpF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expm1l", nullptr, ExpM1l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expm1f", nullptr, ExpM1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ceill", nullptr, CeilL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ceilf", nullptr, CeilF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ceil", nullptr, Ceil, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fabsl", nullptr, FAbsL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fabsf", nullptr, FAbsF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdiml", nullptr, FDimL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdimf", nullptr, FDimF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"floorl", nullptr, FloorL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"floorf", nullptr, FloorF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmal", nullptr, FmaL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmaf", nullptr, FmaF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmaxl", nullptr, FMaxL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmaxf", nullptr, FMaxF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fminl", nullptr, FMinL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fminf", nullptr, FMinF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmodl", nullptr, FmodL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmodf", nullptr, FmodF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expm1", nullptr, ExpM1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2", nullptr, Exp2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cos", nullptr, Cos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erf", nullptr, Erf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copysignl", nullptr, CopySignL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copysignf", nullptr, CopySignF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copysign", nullptr, CopySign, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp", nullptr, Exp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fabs", nullptr, FAbs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdim", nullptr, FDim, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"floor", nullptr, Floor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fma", nullptr, Fma, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmax", nullptr, FMax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmin", nullptr, FMin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmod", nullptr, Fmod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sin", nullptr, Sin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinf", nullptr, Sinf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinl", nullptr, Sinl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinh", nullptr, Sinh, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinhf", nullptr, Sinhf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinhl", nullptr, Sinhl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sqrt", nullptr, Sqrt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sqrtf", nullptr, Sqrtf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sqrtl", nullptr, Sqrtl, nullptr, nullptr, nullptr, napi_default, nullptr}

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
    .nm_modname = "math",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
