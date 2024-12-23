/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

#ifndef JSVM_XTS_NAPI_CLASS_TEST_H
#define JSVM_XTS_NAPI_CLASS_TEST_H

#include "jsvm.h"
#include "jsvm_common.h"
#include "jsvm_types.h"
#include "native_common.h"
#include "test_entry.h"
#include <stdint.h>
#include <stdio.h>
#include <malloc.h>
#include <ctime>
#include <thread>
#include <uv.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include <cstring>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

JSVM_Value TestNewInstanceCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestNewInstanceCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetNewTargetCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetNewTargetCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetNewTargetCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDefineClassCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDefineClassCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestWrapCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestWrapCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestWrapCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestWrapCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestUnwrapCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestUnwrapCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestUnwrapCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestUnwrapCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestRemoveWrapCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestRemoveWrapCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestRemoveWrapCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestRemoveWrapCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestClassOperationCase01(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_CLASS_TEST_H
