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

#ifndef ARKTS_ANI_TEST_OBJECTOPERATIONS_H
#define ARKTS_ANI_TEST_OBJECTOPERATIONS_H
#include "Common.h"

ani_int test_Object_New([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClsData(env, &obj, &cls), ANI_TRUE);

    ani_method ctor {};
    ani_object objResult {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":V", &ctor), ANI_OK);
    ASSERT_EQ(env->Object_New(cls, ctor, &objResult), ANI_OK);
    ASSERT_NE(objResult, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_InstanceOf([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("a", 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_GetType(result, &type), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Object_GetType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("a", 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_GetType(result, &type), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(result, type, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Reference_IsNull([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->CreateEscapeLocalScope(SPECIFIED_CAPACITY), ANI_OK);
    ani_ref nullRef;
    ASSERT_EQ(env->GetNull(&nullRef), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(nullRef, &result), ANI_OK);
    ani_boolean isNull = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNull(result, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Reference_IsUndefined([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->CreateEscapeLocalScope(SPECIFIED_CAPACITY), ANI_OK);
    ani_ref undefined;
    ASSERT_EQ(env->GetUndefined(&undefined), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(undefined, &result), ANI_OK);
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsUndefined(result, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

//待完成
ani_int test_Reference_IsNullishValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_EQ(env->CreateEscapeLocalScope(SPECIFIED_CAPACITY), ANI_OK);
    ani_ref undefined;
    ASSERT_EQ(env->GetUndefined(&undefined), ANI_OK);
    ani_ref result;
    ASSERT_EQ(env->DestroyEscapeLocalScope(undefined, &result), ANI_OK);
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsUndefined(result, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Reference_Equals([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum aniEnum {};
    ASSERT_EQ(env->FindEnum("Lentry/src/main/src/ets/ObjectOperations/ToFind;", &aniEnum), ANI_OK);
    ASSERT_NE(aniEnum, nullptr);

    ani_enum_item redName {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, "RED", &redName), ANI_OK);
    ani_enum_item redIndex {};
    ASSERT_EQ(env->Enum_GetEnumItemByIndex(aniEnum, 0U, &redIndex), ANI_OK);
    ani_boolean isRedEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_Equals(redName, redIndex, &isRedEqual), ANI_OK);
    ASSERT_EQ(isRedEqual, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Array_New_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("Lstd/core/String;", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_array_ref array = nullptr;
    ASSERT_EQ(env->Array_New_Ref(cls, LENGTH_5, nullptr, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_New_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int weight = 200;
    const char m[] = "Pure P60";
    ani_class cls {};
    ASSERT_EQ(env->FindClass("Lentry/src/main/src/ets/ObjectOperations/MobilePhone;", &cls), ANI_OK);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "Lstd/core/String;I:V", &ctor), ANI_OK);
    ani_string model {};
    ASSERT_EQ(env->String_NewUTF8(m, strlen(m), &model), ANI_OK);
    ani_value args[2U];
    args[0U].r = model;
    args[1U].i = weight;
    ani_object phone {};
    ASSERT_EQ(env->Object_New_A(cls, ctor, &phone, args), ANI_OK);
    return ANI_TRUE;
}

#endif //ARKTS_ANI_TEST_OBJECTOPERATIONS_H
