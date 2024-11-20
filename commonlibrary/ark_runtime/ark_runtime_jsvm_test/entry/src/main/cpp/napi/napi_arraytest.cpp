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

#include "napi/native_api.h"
#include "napi_arraytest.h"

const int DIFF_VALUE_FOUR = 4;
const int DIFF_VALUE_TWELVE = 12;

//OH_JSVM_CreateArrayWithLength Test
//lenth 0 + result nonnull
[[maybe_unused]] JSVM_Value TestCreateArrayWithLength_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 0;
    JSVM_Value value0 = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, ArrayLength, &value0);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayWithLength_01: CreateArrayWithLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//length 10 + result nonnull
[[maybe_unused]] JSVM_Value TestCreateArrayWithLength_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 10;
    JSVM_Value value1 = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, ArrayLength, &value1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayWithLength_02: CreateArrayWithLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//lenth JSVM_AUTO_LENGTH + result nonnull
[[maybe_unused]] JSVM_Value TestCreateArrayWithLength_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value value2 = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, JSVM_AUTO_LENGTH, &value2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayWithLength_03: CreateArrayWithLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//lenth 10 + result NULL
[[maybe_unused]] JSVM_Value TestCreateArrayWithLength_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 10;

    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, ArrayLength, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayWithLength_04: CreateArrayWithLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_GetArrayLength
//array object CreateArray + result nonnull
[[maybe_unused]] JSVM_Value TestGetArrayLength_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value ret;
    OH_JSVM_CreateArray(env, &ret);
    bool is_array = false;
    OH_JSVM_IsArray(env,ret,&is_array);
    if (!is_array) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_01: CreateArray Failed");
        return nullptr;
    }
    uint32_t length;
    JSVM_Status status = OH_JSVM_GetArrayLength(env, ret, &length);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_01: GetArrayLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//array object CreateArrayWithLength + result nonnull
[[maybe_unused]] JSVM_Value TestGetArrayLength_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 10;
    JSVM_Value value = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, ArrayLength, &value);
    bool is_array = false;
    OH_JSVM_IsArray(env,value,&is_array);
    if (!is_array) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_02: CreateArrayWithLength Failed");
        return nullptr;
    }    
    uint32_t length;
    status = OH_JSVM_GetArrayLength(env, value, &length);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_02: GetArrayLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not array object + result nonnull
[[maybe_unused]] JSVM_Value TestGetArrayLength_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint32_t length;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_GetArrayLength(env, object, &length);
    if (status != JSVM_ARRAY_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_03: GetArrayLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//array object + result NULL
[[maybe_unused]] JSVM_Value TestGetArrayLength_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 4;
    JSVM_Value testArray = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, ArrayLength, &testArray);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_04:OH_JSVM_CreateArrayWithLength Failed");
        return nullptr;
    }

    status = OH_JSVM_GetArrayLength(env, testArray, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLength_04: GetArrayLength Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_CreateTypedarray
//type INT8_ARRAY + length 0 + arraybuffer obj + "byteOffset + sizeof(type) * length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateTypedarray_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 0;
    JSVM_Value value = nullptr;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_01:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT8_ARRAY, TypedArrayLength, arrayBuffer, 0, &value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_01:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//type UINT8_ARRAY + length not 0 + arrayBuffer obj + "byteOffset + sizeof(type) * length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateTypedarray_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 4;
    JSVM_Value value = nullptr;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_02:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT8_ARRAY, TypedArrayLength, arrayBuffer, 4, &value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_02:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//type UINT8_CLAMPED_ARRAY + length not 0 + nullptr + "byteOffset + sizeof(type) * length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateTypedarray_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t TypedArrayLength = 4;
    JSVM_Value value = nullptr;

    JSVM_Status status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_UINT8_CLAMPED_ARRAY, TypedArrayLength, nullptr, 0, &value);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_03:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//type INT16_ARRAY + length not 0 + other obj + "byteOffset + sizeof(type) * length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateTypedarray_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t TypedArrayLength = 4;
    JSVM_Value value = nullptr;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);

    JSVM_Status status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT16_ARRAY, TypedArrayLength, object, 0, &value);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_04:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//type UINT16_ARRAY + length not 0 + arraybuffer obj + "byteOffset + sizeof(type) * length > sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateTypedarray_05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 2;
    JSVM_Value value = nullptr;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_05:OH_JSVM_Create array buffer Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_UINT16_ARRAY, TypedArrayLength, arrayBuffer, ArrayBufferSize, &value);
    if(status !=  JSVM_GENERIC_FAILURE){
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_05:OH_JSVM_Create type array buffer error.");
        return nullptr;            
    }
    JSVM_Value result = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &result);
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//type INT32_ARRAY + length not 0 + arraybuffer obj + "byteOffset + sizeof(type) * length <= sizeof(arraybuffer)" + NULL
[[maybe_unused]] JSVM_Value TestCreateTypedarray_06(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 2;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_06:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, TypedArrayLength, arrayBuffer, 0, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypedarray_06:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_GetTypedarrayInfo
//typedarray obj
[[maybe_unused]] JSVM_Value TestGetTypedarrayInfo_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    size_t length;
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 4;
    JSVM_Value _value;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetTypedarrayInfo_01:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, TypedArrayLength, arrayBuffer, 0, &_value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetTypedarrayInfo_01:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }

    status = OH_JSVM_GetTypedarrayInfo(env, _value, &type, &length, &data, &arrayBuffer, &byteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetTypedarrayInfo_01:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not typedarray obj
[[maybe_unused]] JSVM_Value TestGetTypedarrayInfo_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    JSVM_Value arrayBuffer;
    size_t length;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);

    JSVM_Status status = OH_JSVM_GetTypedarrayInfo(env, object, &type, &length, &data, &arrayBuffer, &byteOffset);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "testGetTypedarrayInfo_02:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_CreateDataview
//length 0 + arraybuffer obj + "byteOffset +  length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateDataview_01(JSVM_Env env, JSVM_CallbackInfo info)
{    
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_01:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, 0, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_01:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }
    bool isDataView = false;
    OH_JSVM_IsDataview(env, result, &isDataView);
    if (!isDataView) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_01:OH_JSVM_CreateDataview isn't DataView Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//length not 0 + array obj + "byteOffset + length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateDataview_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_02:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_02:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
// length not 0 + nullptr + "byteOffset + length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateDataview_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_03:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, nullptr, 0, &result);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_03:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//  length not 0 + other obj + "byteOffset + length <= sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateDataview_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_04:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, object, 0, &result);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_04:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//length not 0 + arraybuffer obj + "byteOffset + length > sizeof(arraybuffer)" + nonnull
[[maybe_unused]] JSVM_Value TestCreateDataview_05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_05:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, arrayBuffer, ArrayBufferSize, &result);
    if (status != JSVM_PENDING_EXCEPTION) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_05:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }

    JSVM_Value recvmsg = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, & recvmsg);

    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
// length not 0 + arraybuffer obj + "byteOffset + length <= sizeof(arraybuffer)" + NULL
[[maybe_unused]] JSVM_Value TestCreateDataview_06(JSVM_Env env, JSVM_CallbackInfo info)
{    
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_06:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, arrayBuffer, 0, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDataview_06:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_GetDataviewInfo
//dataview obj
[[maybe_unused]] JSVM_Value TestGetDataview_01(JSVM_Env env, JSVM_CallbackInfo info)
{    
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDataview_01:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, 0, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDataview_01:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }
    bool isDataView = false;
    OH_JSVM_IsDataview(env, result, &isDataView);
    if (!isDataView) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDataview_01:OH_JSVM_CreateDataview isn't DataView Failed");
        return nullptr;
    }

    JSVM_Value retArrayBuffer = nullptr;
    void *data = nullptr;
    size_t byteLength = 0;
    size_t byteOffset = -1;
    status = OH_JSVM_GetDataviewInfo(env, result, &byteLength, &data, &retArrayBuffer, &byteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDataview_01:OH_JSVM_CreateDataview GetDataviewInfo Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not dataview obj
[[maybe_unused]] JSVM_Value TestGetDataview_02(JSVM_Env env, JSVM_CallbackInfo info)
{    
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDataview_02:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value retArrayBuffer = nullptr;
    void *data = nullptr;
    size_t byteLength = 0;
    size_t byteOffset = 0;
    status = OH_JSVM_GetDataviewInfo(env, arrayBuffer, &byteLength, &data, &retArrayBuffer, &byteOffset);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDataview_02:OH_JSVM_CreateDataview GetDataviewInfo abnormal");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_SetElement
//arraybuffer obj + index 0 + NULL
[[maybe_unused]] JSVM_Value TestSetElement_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_01:CreateArraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_SetElement(env, arrayBuffer, 0, nullptr);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_01:OH_JSVM_SetElement Failed");
        return nullptr;
    }

    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + index sizeof(obj) + nonnull
[[maybe_unused]] JSVM_Value TestSetElement_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);
    JSVM_Value name1 = nullptr;
    JSVM_Status status = OH_JSVM_SetElement(env, testArray, ArrayBufferSize, name1);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_02:OH_JSVM_SetElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//typedarray obj + index sizeof(obj) +1 + nonnull
[[maybe_unused]] JSVM_Value TestSetElement_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 1;
    const size_t TypedArrayLength = 0;
    JSVM_Value _value;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_03:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }

    JSVM_Value index1 = nullptr;
    OH_JSVM_CreateUint32(env, 1, &index1);
    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_UINT32_ARRAY, TypedArrayLength, arrayBuffer, 0, &_value);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_03:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    status = OH_JSVM_SetElement(env, _value, ArrayBufferSize+1, index1);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_03:OH_JSVM_SetElement 1 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//typedarray obj + index 0 + NULL
[[maybe_unused]] JSVM_Value TestSetElement_04(JSVM_Env env, JSVM_CallbackInfo info)
{    
    JSVM_Value testArray = nullptr;
    const size_t TypedArrayLength = 2;
    OH_JSVM_CreateArrayWithLength(env, TypedArrayLength, &testArray);
    char newStr1[] = "hahaha";
    JSVM_Value name1 = nullptr;
    OH_JSVM_CreateStringUtf8(env, newStr1, strlen(newStr1), &name1);
    JSVM_Status status = OH_JSVM_SetElement(env, testArray, 0, nullptr);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_04:OH_JSVM_SetElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//dataview obj + index sizeof(obj) + nonnull
[[maybe_unused]] JSVM_Value TestSetElement_05(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t Argc = 2;
    JSVM_Value args[2] = {nullptr};
    JSVM_Value arraybuffer = nullptr;
    JSVM_Value result = nullptr;
    OH_JSVM_GetCbInfo(env, info, &Argc, args, nullptr, nullptr);
    OH_JSVM_CoerceToObject(env, args[0], &arraybuffer);
    OH_JSVM_CreateDataview(env, DIFF_VALUE_TWELVE, arraybuffer, DIFF_VALUE_FOUR, &result);
    JSVM_Value name = nullptr;
    JSVM_Status status = OH_JSVM_SetElement(env, result, sizeof(result), name);
    if(status != JSVM_PENDING_EXCEPTION) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_05:OH_JSVM_SetElement Failed");
        return nullptr;
    }

    JSVM_Value recvmsg = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, & recvmsg);

    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not array obj + index 0 + nonnull
[[maybe_unused]] JSVM_Value TestSetElement_06(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value name = nullptr;
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_SetElement(env, object, 0, name);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_06:OH_JSVM_SetElement index 0 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not array obj + index 1 + nonnull
[[maybe_unused]] JSVM_Value TestSetElement_07(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value name = nullptr;
    const char newStr[] = "test";
    OH_JSVM_CreateStringUtf8(env, newStr, strlen(newStr), &name);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_SetElement(env, object, 1, name);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestSetElement_07:OH_JSVM_SetElement index 1 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_GetElement
//arraybuffer obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestGetElement_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);
    JSVM_Value name = nullptr;
    OH_JSVM_SetElement(env, testArray, ArrayBufferSize, name);
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetElement(env, testArray, sizeof(testArray), &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_01:OH_JSVM_GetElement 0 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + set index + NULL
[[maybe_unused]] JSVM_Value TestGetElement_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_02:CreateArraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_SetElement(env, arrayBuffer, 0, nullptr);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_02:OH_JSVM_SetElement Failed");
        return nullptr;
    }

    JSVM_Value propName = nullptr;
    status = OH_JSVM_GetElement(env, arrayBuffer, sizeof(arrayBuffer), &propName);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_02:OH_JSVM_GetElement 1 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//typedarray obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestGetElement_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    const size_t ArrayLen = 2;
    OH_JSVM_CreateArrayWithLength(env, ArrayLen, &testArray);
    JSVM_Value name = nullptr;
    char newStr1[] = "test";
    OH_JSVM_CreateStringUtf8(env, newStr1, strlen(newStr1), &name);
    OH_JSVM_SetElement(env, testArray, ArrayLen, name);

    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetElement(env, testArray, sizeof(testArray), &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_03:OH_JSVM_GetElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//dataview obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestGetElement_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t Argc = 2;
    JSVM_Value args[2] = {nullptr};
    JSVM_Value arraybuffer = nullptr;
    JSVM_Value result = nullptr;
    OH_JSVM_GetCbInfo(env, info, &Argc, args, nullptr, nullptr);
    OH_JSVM_CoerceToObject(env, args[0], &arraybuffer);
    OH_JSVM_CreateDataview(env, DIFF_VALUE_TWELVE, arraybuffer, DIFF_VALUE_FOUR, &result);
    JSVM_Value value = nullptr;
    JSVM_Status status = OH_JSVM_SetElement(env, result, sizeof(result), value);
    if(status != JSVM_PENDING_EXCEPTION) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_04:OH_JSVM_SetElement 0 Failed");
        return nullptr;
    }

    JSVM_Value recvmsg = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &recvmsg);

    JSVM_Value rst = nullptr;
    status = OH_JSVM_GetElement(env, result, sizeof(result), &rst);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "testSetElement_04:OH_JSVM_GetElement 1 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not array obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestGetElement_05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value name = nullptr;
    char newStr[] = "test";
    OH_JSVM_CreateStringUtf8(env, newStr, strlen(newStr), &name);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_SetElement(env, object, 0, name);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_05:OH_JSVM_SetElement index 0 Failed");
        return nullptr;
    }
    
    JSVM_Value result = nullptr;
    status = OH_JSVM_GetElement(env, object, 1, &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_05:OH_JSVM_GetElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestGetElement_06(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);

    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetElement(env, testArray, sizeof(testArray), &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetElement_06:OH_JSVM_GetElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_HasElement
//arraybuffer obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestHasElement_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);
    for(uint32_t i = 0; i < ArrayBufferSize; i++){
          JSVM_Value element;
          OH_JSVM_CreateUint32(env, i * 2, &element);
          OH_JSVM_SetElement(env, testArray, i, element);
    }

    bool hasElement = false;
    JSVM_Status status = OH_JSVM_HasElement(env, testArray, 0, &hasElement);

    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//typedarray obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestHasElement_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLen = 2;
    JSVM_Value testArray = nullptr;
    OH_JSVM_CreateArrayWithLength(env, ArrayLen, &testArray);
    JSVM_Value name = nullptr;
    char newStr1[] = "test";
    OH_JSVM_CreateStringUtf8(env, newStr1, strlen(newStr1), &name);
    JSVM_Status status = OH_JSVM_SetElement(env, testArray, 0, name);
    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(!hasElement){
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_02:OH_JSVM_HasElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//dataview obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestHasElement_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t Argc = 2;
    JSVM_Value args[2] = {nullptr};
    JSVM_Value arraybuffer = nullptr;
    JSVM_Value result = nullptr;
    OH_JSVM_GetCbInfo(env, info, &Argc, args, nullptr, nullptr);
    OH_JSVM_CoerceToObject(env, args[0], &arraybuffer);
    OH_JSVM_CreateDataview(env, DIFF_VALUE_TWELVE, arraybuffer, DIFF_VALUE_FOUR, &result);
    JSVM_Value Value = nullptr;
    JSVM_Status status = OH_JSVM_SetElement(env, result, sizeof(result), Value);
    if(status != JSVM_PENDING_EXCEPTION) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_03:OH_JSVM_SetElement 0 Failed");
        return nullptr;
    }

    JSVM_Value recvmsg = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &recvmsg);    

    bool hasElement = false;
    OH_JSVM_HasElement(env, result, 0, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_03:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not array obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestHasElement_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value name = nullptr;
    char newStr[] = "test";
    OH_JSVM_CreateStringUtf8(env, newStr, strlen(newStr), &name);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_SetElement(env, object, 0, name);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_04:OH_JSVM_SetElement index 0 Failed");
        return nullptr;
    }

    bool hasElement = false;
    OH_JSVM_HasElement(env, object, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_04:OH_JSVM_HasElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + not set index + nonnull
[[maybe_unused]] JSVM_Value TestHasElement_05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);
    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(hasElement){
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_05:OH_JSVM_HasElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + set index + NULL
[[maybe_unused]] JSVM_Value TestHasElement_06(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_06:CreateArraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_SetElement(env, arrayBuffer, 0, nullptr);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_06:OH_JSVM_SetElement Failed");
        return nullptr;
    }

    bool hasElement = false;
    OH_JSVM_HasElement(env, arrayBuffer, 0, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasElement_06:OH_JSVM_HasElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//OH_JSVM_DeleteElement
//arraybuffer obj  + set index + nonnull
[[maybe_unused]] JSVM_Value TestDeleteElement_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);
    JSVM_Value name = nullptr;
    OH_JSVM_SetElement(env, testArray, ArrayBufferSize, name);
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetElement(env, testArray, sizeof(testArray), &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_01:OH_JSVM_GetElement 0 Failed");
        return nullptr;
    }

    bool rst = false;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_01:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//typedarray obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestDeleteElement_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    const size_t ArrayLen = 4;
    OH_JSVM_CreateArrayWithLength(env, ArrayLen, &testArray);
    uint32_t data = 1;
    JSVM_Value _value = nullptr;
    OH_JSVM_CreateUint32(env, data, &_value);
    JSVM_Status status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, ArrayLen, testArray, 0, &_value);
    OH_JSVM_SetElement(env, testArray, 0, _value);
    bool hasElement = false;
    status = OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(!hasElement){
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_02:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = false;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_02:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//dataview obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestDeleteElement_03(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t Argc = 2;
    JSVM_Value args[2] = {nullptr};
    JSVM_Value arraybuffer = nullptr;
    JSVM_Value result = nullptr;
    OH_JSVM_GetCbInfo(env, info, &Argc, args, nullptr, nullptr);
    OH_JSVM_CoerceToObject(env, args[0], &arraybuffer);
    OH_JSVM_CreateDataview(env, DIFF_VALUE_TWELVE, arraybuffer, DIFF_VALUE_FOUR, &result);
    
    JSVM_Status status = OH_JSVM_SetElement(env, result, sizeof(result), nullptr);
    if(status != JSVM_PENDING_EXCEPTION) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_03:OH_JSVM_SetElement 0 Failed");
        return nullptr;
    }

    JSVM_Value recvmsg = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &recvmsg);    
    
    bool rst = false;
    OH_JSVM_DeleteElement(env, result, 0, &rst);
    if(rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_03:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }

    recvmsg = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &recvmsg); 

    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//not array obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestDeleteElement_04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value name = nullptr;
    char newStr[] = "test";
    OH_JSVM_CreateStringUtf8(env, newStr, strlen(newStr), &name);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_SetElement(env, object, 0, name);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_04:OH_JSVM_SetElement index 0 Failed");
        return nullptr;
    }

    bool rst = false;
    OH_JSVM_DeleteElement(env, object, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_04:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + set index + nonnull
[[maybe_unused]] JSVM_Value TestDeleteElement_05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testArray = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &testArray);

    bool rst = false;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_05:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//arraybuffer obj + set index + NULL
[[maybe_unused]] JSVM_Value TestDeleteElement_06(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 4;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_06:CreateArraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_SetElement(env, arrayBuffer, 0, nullptr);
    if(status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_06:OH_JSVM_SetElement Failed");
        return nullptr;
    }

    bool rst = false;
    OH_JSVM_DeleteElement(env, arrayBuffer, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteElement_06:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//API Combination Call Case
//CreatArray/CreateArrayWithLength-> GetArrayLength，Check if it meets expectations ->  IsArray Determine whether it is an array，
//return true -> SetElement -> GetElement, Consistent with set -> HasElement Determine whether there are array elements present，
//If set, return true; if not set, return false -> DeleteElement，If set, return true; if not set, return false
//The following 01 case represents the situation of set, and 02 represents the situation of not set.
[[maybe_unused]] JSVM_Value TestArrayProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 4;
    JSVM_Value testArray = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, ArrayLength, &testArray);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01:OH_JSVM_CreateArrayWithLength Failed");
        return nullptr;
    }

    bool is_array = false;
    OH_JSVM_IsArray(env,testArray,&is_array);
    if (!is_array) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01: is_array Failed");
        return nullptr;
    }
    
    uint32_t length;
    status = OH_JSVM_GetArrayLength(env, testArray, &length);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01: GetArrayLength 01 Failed");
        return nullptr;
    }
    if(length != 4) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01: GetArrayLength 02 Failed");
        return nullptr;
    }
    
    for(uint32_t i = 0; i < 4; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, i, &element);
        status = OH_JSVM_SetElement(env, testArray, i, element);
        if(status != JSVM_OK) {
            OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01:OH_JSVM_SetElement Failed");
            return nullptr;
        }
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_GetElement(env, testArray, sizeof(testArray), &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01:OH_JSVM_GetElement 1 Failed");
        return nullptr;
    }

    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = false;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayProcessSteps_01:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}

[[maybe_unused]] JSVM_Value TestArrayProcessSteps_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t arrayLength = 4;
    JSVM_Value testArray = nullptr;
    JSVM_Status status = OH_JSVM_CreateArrayWithLength(env, arrayLength, &testArray);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "testArrayProcessSteps_02:OH_JSVM_CreateArrayWithLength Failed");
        return nullptr;
    }

    bool is_array = false;
    OH_JSVM_IsArray(env,testArray,&is_array);
    if (!is_array) {
        OH_JSVM_ThrowError(env, nullptr, "testArrayProcessSteps_02: is_array Failed");
        return nullptr;
    }

    uint32_t length;
    status = OH_JSVM_GetArrayLength(env, testArray, &length);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "testArrayProcessSteps_02: GetArrayLength 01 Failed");
        return nullptr;
    }
    if(length != 4) {
        OH_JSVM_ThrowError(env, nullptr, "testArrayProcessSteps_02: GetArrayLength 02 Failed");
        return nullptr;
    }

    bool hasElement = true;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "testArrayProcessSteps_02:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = true;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "testArrayProcessSteps_02:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//CreatArraybuffer -> createTypedarray -> GetTypedarrayInfo get Typedarray，
//Consistent with creation -> IsTypedarray if it is a Typedarray, return true ->  IsArray，return false -> SetElement -> GetElement,
//Consistent with set -> HasElement，
//If set, return true; if not set, return false -> DeleteElement，If set, return true; if not set, return false.
//The following 01 case represents the situation of set, and 02 represents the situation of not set.
[[maybe_unused]] JSVM_Value TestTypedarrayProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    size_t length;
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 4;
    JSVM_Value _value;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, TypedArrayLength, arrayBuffer, 0, &_value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    status = OH_JSVM_GetTypedarrayInfo(env, _value, &type, &length, &data, &arrayBuffer, &byteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }
    if(length != TypedArrayLength) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }

    bool isTypedArray = false;
    OH_JSVM_IsTypedarray(env, _value, &isTypedArray);
    if(!isTypedArray) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:is not typed array Failed");
        return nullptr;
    }

    bool is_array = true;
    OH_JSVM_IsArray(env,_value,&is_array);
    if (is_array) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01: is array");
        return nullptr;
    }

    for(uint32_t i = 0; i < 16; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, 1, &element);
        status = OH_JSVM_SetElement(env, _value, i, element);
        if(status != JSVM_OK) {
            OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_SetElement Failed");
            return nullptr;
        }
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_GetElement(env, _value, 0, &result);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_GetElement 1 Failed");
        return nullptr;
    }

    bool hasElement = false;
    OH_JSVM_HasElement(env, _value, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = false;
    status = OH_JSVM_DeleteElement(env, _value, TypedArrayLength, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_01:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}

[[maybe_unused]] JSVM_Value TestTypedarrayProcessSteps_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    size_t length;
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    const size_t TypedArrayLength = 4;
    JSVM_Value _value;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT32_ARRAY, TypedArrayLength, arrayBuffer, 0, &_value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    status = OH_JSVM_GetTypedarrayInfo(env, _value, &type, &length, &data, &arrayBuffer, &byteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }
    if(length != TypedArrayLength) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }

    bool isTypedArray = false;
    OH_JSVM_IsTypedarray(env, _value, &isTypedArray);
    if(!isTypedArray) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:is not typed array Failed");
        return nullptr;        
    }

    bool hasElement = true;
    OH_JSVM_HasElement(env, _value, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = true;
    status = OH_JSVM_DeleteElement(env, _value, 0, &rst);
    if(rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypedarrayProcessSteps_02:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//CreatArraybuffer-> createDataview -> GetDataviewInfo，
//Consistent with creation -> IsDataview if is Dataview, return true ->  IsArray，
//return false -> SetElement -> GetElement , Consistent with set -> HasElement，
//If set, return true; if not set, return false -> DeleteElement，If set, return true; if not set, return false.
//The following 01 case represents the situation of set, and 02 represents the situation of not set.
[[maybe_unused]] JSVM_Value TestArrayDataviewProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if(status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:CreateArraybuffer Failed");
        return nullptr;        
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }

    bool isDataView = false;
    OH_JSVM_IsDataview(env, result, &isDataView);
    if (!isDataView) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_CreateDataview isn't DataView Failed");
        return nullptr;
    }

    JSVM_Value retArrayBuffer = nullptr;
    void *data = nullptr;
    size_t ByteLength = 0;
    size_t ByteOffset = -1;
    status = OH_JSVM_GetDataviewInfo(env, result, &ByteLength, &data, &retArrayBuffer, &ByteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_CreateDataview GetDataviewInfo Failed");
        return nullptr;
    }

    bool is_array = true;
    OH_JSVM_IsArray(env,result,&is_array);
    if (is_array) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01: is array");
        return nullptr;
    }
    JSVM_Value Inputstr = nullptr;
    OH_JSVM_CreateInt32(env, 3, &Inputstr);
    status = OH_JSVM_SetElement(env, result, 0, Inputstr);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_SetElement 0 Failed");
        return nullptr;
    }

    bool hasElement = false;
    OH_JSVM_HasElement(env, result, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    JSVM_Value rst = nullptr;
    status = OH_JSVM_GetElement(env, result, sizeof(result), &rst);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_GetElement Failed");
        return nullptr;
    }

    bool rst_value = false;
    OH_JSVM_DeleteElement(env, result, 0, &rst_value);
    if(!rst_value) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_01:OH_JSVM_DeleteElement Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}

[[maybe_unused]] JSVM_Value TestArrayDataviewProcessSteps_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if(status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02:CreateArraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }

    bool isDataView = false;
    OH_JSVM_IsDataview(env, result, &isDataView);
    if (!isDataView) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02:OH_JSVM_CreateDataview isn't DataView Failed");
        return nullptr;
    }

    JSVM_Value retArrayBuffer = nullptr;
    void *data = nullptr;
    size_t ByteLength = 0;
    size_t ByteOffset = -1;
    status = OH_JSVM_GetDataviewInfo(env, result, &ByteLength, &data, &retArrayBuffer, &ByteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02:OH_JSVM_CreateDataview GetDataviewInfo Failed");
        return nullptr;
    }

    bool is_array = true;
    OH_JSVM_IsArray(env,result,&is_array);
    if (is_array) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02: is array");
        return nullptr;
    }

    bool hasElement = true;
    OH_JSVM_HasElement(env, result, 0, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02:OH_JSVM_HasElement");
        return nullptr;
    }

    bool rst = true;
    OH_JSVM_DeleteElement(env, result, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDataviewProcessSteps_02:OH_JSVM_DeleteElement Failed.");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//CreatArraybuffer -> createTypedarray -> GetTypedarrayInfo，
//Consistent with creation -> IsTypedarray if it is Typedarray, return true -> createDataview -> GetDataviewInfo，
//Consistent with creation -> IsDataview if it is Dataview, return true
[[maybe_unused]] JSVM_Value TestTypeArrayAndDataviewProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t ArrayBufferSize = 16;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, ArrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if(status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:CreateArraybuffer Failed");
        return nullptr;
    }
    
    JSVM_Value _value = nullptr;
    size_t typedArrayLength = 0;
    status = OH_JSVM_CreateTypedarray(env, JSVM_TypedarrayType::JSVM_INT16_ARRAY, typedArrayLength, arrayBuffer, 0, &_value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }
    JSVM_TypedarrayType type;
    size_t byteOffset = 0;
    void *data = nullptr;
    status = OH_JSVM_GetTypedarrayInfo(env, _value, &type, &typedArrayLength, &data, &arrayBuffer, &byteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:OH_JSVM_GetTypedarrayInfo Failed");
        return nullptr;
    }

    bool isTypedArray = false;
    OH_JSVM_IsTypedarray(env, _value, &isTypedArray);
    if(!isTypedArray) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:is not typed array Failed");
    return nullptr;        
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, ArrayBufferSize, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }

    bool isDataView = false;
    OH_JSVM_IsDataview(env, result, &isDataView);
    if (!isDataView) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:OH_JSVM_CreateDataview isn't DataView Failed");
        return nullptr;
    }

    JSVM_Value retArrayBuffer = nullptr;
    size_t ByteLength = 0;
    size_t ByteOffset = 0;
    status = OH_JSVM_GetDataviewInfo(env, result, &ByteLength, &data, &retArrayBuffer, &ByteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArrayAndDataviewProcessSteps_01:OH_JSVM_CreateDataview GetDataviewInfo Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//TypeArray repeated set at the same index
[[maybe_unused]] JSVM_Value TestTypeArraySetMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t TypedArrayLength = 8;
    JSVM_Value testArray = nullptr;
    OH_JSVM_CreateArrayWithLength(env, TypedArrayLength, &testArray);
    JSVM_Value name = nullptr;
    char newStr1[] = "abc";
    OH_JSVM_CreateStringUtf8(env, newStr1, strlen(newStr1), &name);
    JSVM_Status status = OH_JSVM_SetElement(env, testArray, TypedArrayLength, name);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArraySetMultipleTimes_01:OH_JSVM_SetElement 1 Failed");
        return nullptr;
    }
    
    for (uint32_t i = 0; i < 2; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, i + 1, &element);
        status = OH_JSVM_SetElement(env, testArray, i, element);
        if(status != JSVM_OK) {
            OH_JSVM_ThrowError(env, nullptr, "TestTypeArraySetMultipleTimes_01:OH_JSVM_SetElement 2 Failed");
            return nullptr;
        }
    }
    
    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArraySetMultipleTimes_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    JSVM_Value rst = nullptr;
    status = OH_JSVM_GetElement(env, testArray, 0, &rst);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeArraySetMultipleTimes_01:OH_JSVM_GetElement 1 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//Array repeated set at the same index
[[maybe_unused]] JSVM_Value TestArraySetMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t ArrayLength = 2;
    JSVM_Value lhs;
    OH_JSVM_CreateArrayWithLength(env, ArrayLength, &lhs);
    for (uint32_t i = 0; i < ArrayLength; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, i + 1, &element);
        OH_JSVM_SetElement(env, lhs, i, element);
    }

    size_t testlen = 3;
    JSVM_Value element;
    OH_JSVM_CreateUint32(env, testlen, &element);
    JSVM_Status status = OH_JSVM_SetElement(env, lhs, 3, element);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArraySetMultipleTimes_01:OH_JSVM_SetElement 2 Failed");
        return nullptr;
    }

    bool hasElement = false;
    OH_JSVM_HasElement(env, lhs, 1, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArraySetMultipleTimes_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    JSVM_Value rst = nullptr;
    status = OH_JSVM_GetElement(env, lhs, 1, &rst);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArraySetMultipleTimes_01:OH_JSVM_GetElement 1 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//TypeArray gets multiple times
[[maybe_unused]] JSVM_Value TestArrayGetMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t TypedArrayLength = 8;
    JSVM_Value testArray = nullptr;
    OH_JSVM_CreateArrayWithLength(env, TypedArrayLength, &testArray);
    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Status status = OH_JSVM_SetElement(env, testArray, TypedArrayLength, value);
    
    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 2, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayGetMultipleTimes_01:OH_JSVM_HasElement Abnormal.");
        return nullptr;
    }

    JSVM_Value rst = nullptr;
    status = OH_JSVM_GetElement(env, testArray, 2, &rst);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayGetMultipleTimes_01:OH_JSVM_GetElement 0 Abnormal.");
        return nullptr;
    }
 
    status = OH_JSVM_GetElement(env, testArray, TypedArrayLength, &rst);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayGetMultipleTimes_01:OH_JSVM_GetElement 2 Failed");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//Repeat delete, same index
//Return the execution status code JSVM_Status. JSVM-OK indicates successful execution.
//JSVM_GENERIC_SAILURE indicates that there is an unknown reason causing execution failure.
[[maybe_unused]] JSVM_Value TestArrayDeleteMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t TestLen = 4;
    size_t TestLen1 = 2;
    JSVM_Value testArray = nullptr;
    OH_JSVM_CreateArrayWithLength(env, TestLen, &testArray);
    JSVM_Value index1 = nullptr;
    OH_JSVM_CreateUint32(env, 1, &index1);
    JSVM_Value index2 = nullptr;
    OH_JSVM_CreateUint32(env, TestLen, &index2);
    OH_JSVM_SetElement(env, testArray, 0, index1);
    OH_JSVM_SetElement(env, testArray, 1, index2);

    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_01:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = true;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_01:OH_JSVM_DeleteElement Failed.");
        return nullptr;
    }
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_01:OH_JSVM_HasElement 1 Failed");
        return nullptr;
    }
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_01:OH_JSVM_DeleteElement 1 Failed.");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}
//Multiple deletions with different indices
[[maybe_unused]] JSVM_Value TestArrayDeleteMultipleTimes_02(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t TestLen0 = 2;
    const size_t TestLen1 = 5;
    JSVM_Value testArray = nullptr;
    OH_JSVM_CreateArrayWithLength(env, TestLen0, &testArray);
    JSVM_Value index1 = nullptr;
    OH_JSVM_CreateUint32(env, 1, &index1);
    JSVM_Value index2 = nullptr;
    OH_JSVM_CreateUint32(env, TestLen0, &index2);
    OH_JSVM_SetElement(env, testArray, 0, index1);
    OH_JSVM_SetElement(env, testArray, 1, index2);

    bool hasElement = false;
    OH_JSVM_HasElement(env, testArray, 0, &hasElement);
    if(!hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_02:OH_JSVM_HasElement Failed");
        return nullptr;
    }

    bool rst = true;
    OH_JSVM_DeleteElement(env, testArray, 0, &rst);
    if(!rst) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_02:OH_JSVM_DeleteElement Failed.");
        return nullptr;
    }

    OH_JSVM_HasElement(env, testArray, TestLen1, &hasElement);
    if(hasElement) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_02:OH_JSVM_HasElement Failed");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_DeleteElement(env, testArray, TestLen1, &rst);
    if(status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestArrayDeleteMultipleTimes_02:OH_JSVM_DeleteElement 1 Failed.");
        return nullptr;
    }
    
    bool setvalue = true;
    JSVM_Value retvalue = nullptr;
    OH_JSVM_GetBoolean(env, setvalue, &retvalue);
    return retvalue;
}