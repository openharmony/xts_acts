/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_FIXEDARRAY_H
#define ARKTS_ANI_TEST_FIXEDARRAY_H
#include "Common.h"

const ani_size ZERO = 0;
const ani_size OFFSET_0 = 0;
const ani_size LENGTH_1 = 1;
const ani_size LENGTH_10 = 10;
const float TEST_VALUE_1 = 1.0F;
const float TEST_VALUE_2 = 2.0F;
const float TEST_VALUE_3 = 3.0F;
const float TEST_VALUE_4 = 4.0F;
const float TEST_VALUE_5 = 5.0F;

ani_int test_FixedArray_GetLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env->FixedArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_int test_FixedArray_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_boolean array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Boolean(LENGTH_5, &array), ANI_OK);
    ani_boolean nativeBuffer[LENGTH_10] = {ANI_TRUE};
    ASSERT_EQ(env->FixedArray_GetRegion_Boolean(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Boolean(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_byte array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Byte(LENGTH_5, &array), ANI_OK);
    ani_byte nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Byte(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Byte(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_char array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Char(LENGTH_5, &array), ANI_OK);
    ani_char nativeBuffer[LENGTH_5] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Char(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Char(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_short array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Short(LENGTH_5, &array), ANI_OK);
    ani_short nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Short(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Short(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_int array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Int(LENGTH_5, &array), ANI_OK);
    ani_int nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Int(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_long array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Long(LENGTH_5, &array), ANI_OK);
    ani_long nativeBuffer[LENGTH_10] = {0};
    ASSERT_EQ(env->FixedArray_GetRegion_Long(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Long(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_float array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Float(LENGTH_5, &array), ANI_OK);
    ani_float nativeBuffer[LENGTH_5] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env->FixedArray_GetRegion_Float(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Float(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_fixedarray_double array = nullptr;
    ASSERT_EQ(env->FixedArray_New_Double(LENGTH_5, &array), ANI_OK);
    ani_double nativeBuffer[LENGTH_10] = {TEST_VALUE_1, TEST_VALUE_2, TEST_VALUE_3, TEST_VALUE_4, TEST_VALUE_5};
    ASSERT_EQ(env->FixedArray_GetRegion_Double(array, OFFSET_0, LENGTH_1, nativeBuffer), ANI_OK);
    ASSERT_EQ(env->FixedArray_SetRegion_Double(array, OFFSET_0, LENGTH_5, nativeBuffer), ANI_OK);
    return ANI_TRUE;
}

// NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
template <typename R, typename... Args>
ani_int DoCallFunction(ani_env *env, std::optional<R> *result, ani_function fn, Args &&...args)
{
    std::conditional_t<std::is_same_v<R, void>, std::nullopt_t, R> value {};
    ani_status status;

    if constexpr (std::is_same_v<R, ani_boolean>) {
        status = env->Function_Call_Boolean(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_byte>) {
        status = env->Function_Call_Byte(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_char>) {
        status = env->Function_Call_Char(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_short>) {
        status = env->Function_Call_Short(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_int>) {
        status = env->Function_Call_Int(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_long>) {
        status = env->Function_Call_Long(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_float>) {
        status = env->Function_Call_Float(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_double>) {
        status = env->Function_Call_Double(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, void>) {
        status = env->Function_Call_Void(fn, std::forward<Args>(args)...);
        value = std::nullopt;
    } else if constexpr (std::is_same_v<R, ani_ref> || std::is_same_v<R, ani_tuple_value> ||
        std::is_same_v<R, ani_object>) {
        ani_ref resultRef {};
        status = env->Function_Call_Ref(fn, &resultRef, std::forward<Args>(args)...);
        value = static_cast<R>(resultRef);
    } else {
        enum { INCORRECT_TEMPLATE_TYPE = false };
        static_assert(INCORRECT_TEMPLATE_TYPE, "Incorrect template type");
    }

    if (status == ANI_PENDING_ERROR) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    ASSERT_EQ(status, ANI_OK);

    result->emplace(value);
    return ANI_TRUE;
}
// NOLINTEND(cppcoreguidelines-pro-type-vararg)

template <typename R, typename... Args>
ani_int CallEtsFunctionImpl(ani_env *env, std::optional<R> *result, const std::string &moduleDescriptor,
                            const std::string &fnName, Args &&...args)
{
    ani_module mod {};
    ASSERT_EQ(env->FindModule(moduleDescriptor.c_str(), &mod), ANI_OK);
    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(mod, fnName.c_str(), nullptr, &fn), ANI_OK);
    ASSERT_EQ(DoCallFunction(env, result, fn, std::forward<Args>(args)...), ANI_TRUE);
    return ANI_TRUE;
}

/// Call function with name `fnName` from module denoted by `moduleDescriptor`
template <typename R, typename... Args>
R CallEtsFunction(ani_env *env, const std::string &moduleName, const std::string &fnName, Args &&...args)
{
    std::optional<R> result;
    auto moduleDescriptor = "L" + moduleName + ";";
    CallEtsFunctionImpl(env, &result, moduleDescriptor, fnName, std::forward<Args>(args)...);
    if constexpr (!std::is_same_v<R, void>) {
        return result.value();
    }
}

ani_int test_FixedArray_Get_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry/src/main/src/ets/FixedArray";
    auto array = static_cast<ani_fixedarray_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getArray1"));
    const ani_size index1 = 1;
    const ani_size index2 = 2;
    ani_ref ref1 = nullptr;
    ani_ref ref2 = nullptr;
    ani_boolean isNull;
    ASSERT_EQ(env->FixedArray_Get_Ref(array, index1, &ref1), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lstd/core/String;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    // Test zero length
    ani_fixedarray_ref zeroLengthArray = nullptr;
    ASSERT_EQ(env->FixedArray_New_Ref(cls, ZERO, nullptr, &zeroLengthArray), ANI_OK);
    ASSERT_NE(zeroLengthArray, nullptr);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry/src/main/src/ets/FixedArray";
    auto array = static_cast<ani_fixedarray_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getArray2"));

    auto newValue1 = static_cast<ani_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getNewString1"));
    const ani_size index1 = 0;
    ASSERT_EQ(env->FixedArray_Set_Ref(array, index1, newValue1), ANI_OK);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_FIXEDARRAY_H
