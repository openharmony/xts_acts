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

#ifndef JSVM_XTS_NAPI_STRING_TEST_H
#define JSVM_XTS_NAPI_STRING_TEST_H
#include "jsvm.h"
#include "jsvm_common.h"
#include "native_common.h"
#include "test_entry.h"
#include "securec.h"
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
#endif //JSVM_XTS_NAPI_STRING_TEST_H

const size_t BUF_SIZE_MAX = 128;
const size_t BUF_SIZE_20 = 20;
const size_t BUF_SIZE_10 = 10;
const size_t BUF_SIZE_5 = 5;

// OH_JSVM_GetValueStringUtf8 interface
[[maybe_unused]] JSVM_Value TestGetValueStringUtf8test1(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf8test2(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf8test3(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf8test4(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf8test5(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf8test6(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_CreateStringUtf8 interface
[[maybe_unused]] JSVM_Value TestCreateStringUtf8test1(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringUtf8test2(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringUtf8test3(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringUtf8test4(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_CreateStringUtf16 interface
[[maybe_unused]] JSVM_Value TestCreateStringUtf16test1(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringUtf16test2(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringUtf16test3(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringUtf16test4(JSVM_Env env, JSVM_CallbackInfo info);

//OH_JSVM_GetValueStringUtf16 interface
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16test1(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16test2(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16test3(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16test4(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16test5(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16test6(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_CreateStringLatin1 interface
[[maybe_unused]] JSVM_Value TestCreateStringLatin1test1(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringLatin1test2(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringLatin1test3(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestCreateStringLatin1test4(JSVM_Env env, JSVM_CallbackInfo info);

// OH_JSVM_GetValueStringLatin1 interface
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1test1(JSVM_Env env, JSVM_CallbackInfo info); 
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1test2(JSVM_Env env, JSVM_CallbackInfo info); 
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1test3(JSVM_Env env, JSVM_CallbackInfo info); 
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1test4(JSVM_Env env, JSVM_CallbackInfo info); 
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1test5(JSVM_Env env, JSVM_CallbackInfo info); 
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1test6(JSVM_Env env, JSVM_CallbackInfo info); 

// OH_JSVM_IsString interface
[[maybe_unused]] JSVM_Value TestIsStringtest1(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestIsStringtest2(JSVM_Env env, JSVM_CallbackInfo info);
[[maybe_unused]] JSVM_Value TestIsStringtest3(JSVM_Env env, JSVM_CallbackInfo info);

// combination interface
[[maybe_unused]] JSVM_Value TestOthertest1(JSVM_Env env, JSVM_CallbackInfo info);