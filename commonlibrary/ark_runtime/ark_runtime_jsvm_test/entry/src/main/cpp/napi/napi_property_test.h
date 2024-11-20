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

#ifndef JSVM_XTS_NAPI_PROPERTY_TEST_H
#define JSVM_XTS_NAPI_PROPERTY_TEST_H
#include "jsvm.h"
#include "jsvm_common.h"
#include "native_common.h"
#include "test_entry.h"
#include "securec.h"
#include <cstdint>
#include <cstdio>
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

//OH_JSVM_HasProperty(JSVM_Env env, JSVM_Value object, JSVM_Value key, bool* result)
JSVM_Value TestHasPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
//OH_JSVM_DeleteProperty(JSVM_Env env, JSVM_Value object, JSVM_Value key, bool* result)
JSVM_Value TestDeletePropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeletePropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
//OH_JSVM_HasOwnProperty(JSVM_Env env, JSVM_Value object, JSVM_Value key, bool* result)
JSVM_Value TestHasOwnPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasOwnPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasOwnPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info);
//OH_JSVM_GetNamedProperty(JSVM_Env env, JSVM_Value object, const char* utf8name, JSVM_Value* result)
JSVM_Value TestGetNamedPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetNamedPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetNamedPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info);
//OH_JSVM_HasNamedProperty(JSVM_Env env, JSVM_Value object, const char* utf8name, bool* result)
JSVM_Value TestHasNamedPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasNamedPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasNamedPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasNamedPropertyTest4(JSVM_Env env, JSVM_CallbackInfo info);
//OH_JSVM_DefineProperties(JSVM_Env env, JSVM_Value object, size_t propertyCount, const JSVM_PropertyDescriptor* properties);
JSVM_Value TestDefinePropertiesTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDefinePropertiesTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDefinePropertiesTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDefinePropertiesTest4(JSVM_Env env, JSVM_CallbackInfo info);
//Combination
JSVM_Value TestCombinationPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationPropertyTest4(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationNamedPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCombinationNamedPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_PROPERTY_TEST_H
