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
#include "AccessingStaticFields.h"
#include "Common.h"
#include "ClassOperations.h"
#include "Exceptions.h"
#include "GlobalAndLocalReferences.h"
#include "ObjectOperations.h"
#include "VersionInfo.h"
#include "ClassCallingStaticMethods.h"

namespace {
std::array methods = {
    ani_native_function {"test_GetVersion", ":I",
                         reinterpret_cast<void *>(test_GetVersion)},
    ani_native_function {"test_FindClass", ":Z",
                         reinterpret_cast<void *>(test_FindClass)},
    ani_native_function {"test_Class_FindStaticMethodBoolean", ":Z",
                         reinterpret_cast<void *>(test_Class_FindStaticMethodBoolean)},
    ani_native_function {"test_Class_FindStaticMethodInt", ":Z",
                         reinterpret_cast<void *>(test_Class_FindStaticMethodInt)},
    ani_native_function {"test_GlobalReference_Create", ":Z",
                         reinterpret_cast<void *>(test_GlobalReference_Create)},
    ani_native_function {"test_ExistUnhandledError", ":Z",
                         reinterpret_cast<void *>(test_ExistUnhandledError)},
    ani_native_function {"test_Class_FindMethod", ":Z",
                         reinterpret_cast<void *>(test_Class_FindMethod)},
    ani_native_function {"test_Class_BindNativeMethods", ":Z",
                         reinterpret_cast<void *>(test_Class_BindNativeMethods)},
    ani_native_function {"test_Type_GetSuperClass", ":Z",
                         reinterpret_cast<void *>(test_Type_GetSuperClass)},
    ani_native_function {"test_Type_IsAssignableFrom", ":Z",
                         reinterpret_cast<void *>(test_Type_IsAssignableFrom)},
    ani_native_function {"test_FindModule", ":Z",
                         reinterpret_cast<void *>(test_FindModule)},
    ani_native_function {"test_FindNamespace", ":Z",
                         reinterpret_cast<void *>(test_FindNamespace)},
    ani_native_function {"test_FindEnum", ":Z",
                         reinterpret_cast<void *>(test_FindEnum)},
    ani_native_function {"test_GlobalReference_Create", ":Z",
                         reinterpret_cast<void *>(test_GlobalReference_Create)},
    ani_native_function {"test_Reference_StrictEquals", ":Z",
                         reinterpret_cast<void *>(test_Reference_StrictEquals)},
    ani_native_function {"test_GlobalReference_Delete", ":Z",
                         reinterpret_cast<void *>(test_GlobalReference_Delete)},
    ani_native_function {"test_Reference_Delete", ":Z",
                         reinterpret_cast<void *>(test_Reference_Delete)},
    ani_native_function {"test_EnsureEnoughReferences", ":Z",
                         reinterpret_cast<void *>(test_EnsureEnoughReferences)},
    ani_native_function {"test_Object_InstanceOf", ":Z",
                         reinterpret_cast<void *>(test_Object_InstanceOf)},
    ani_native_function {"test_Object_GetType", ":Z",
                         reinterpret_cast<void *>(test_Object_GetType)},
    ani_native_function {"test_Object_New", ":Z",
                         reinterpret_cast<void *>(test_Object_New)},
    ani_native_function {"test_Reference_IsNull", ":Z",
                         reinterpret_cast<void *>(test_Reference_IsNull)},
    ani_native_function {"test_Reference_IsUndefined", ":Z",
                         reinterpret_cast<void *>(test_Reference_IsUndefined)},
    ani_native_function {"test_Reference_IsNullishValue", ":Z",
                         reinterpret_cast<void *>(test_Reference_IsNullishValue)},
    ani_native_function {"test_Reference_Equals", ":Z",
                         reinterpret_cast<void *>(test_Reference_Equals)},
    ani_native_function {"test_Array_New_Ref", ":Z",
                         reinterpret_cast<void *>(test_Array_New_Ref)},
    ani_native_function {"test_Object_New_A", ":Z",
                         reinterpret_cast<void *>(test_Object_New_A)},
    ani_native_function {"test_Class_GetStaticField_Boolean", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Boolean)},
    ani_native_function {"test_Class_GetStaticField_Char", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Char)},
    ani_native_function {"test_Class_GetStaticField_Byte", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Byte)},
    ani_native_function {"test_Class_GetStaticField_Short", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Short)},
    ani_native_function {"test_Class_GetStaticField_Int", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Int)},
    ani_native_function {"test_Class_GetStaticField_Long", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Long)},
    ani_native_function {"test_Class_GetStaticField_Float", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Float)},
    ani_native_function {"test_Class_GetStaticField_Double", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Double)},
    ani_native_function {"test_Class_GetStaticField_Ref", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticField_Ref)},
    ani_native_function {"test_Class_SetStaticField_Boolean", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Boolean)},
    ani_native_function {"test_Class_SetStaticField_Char", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Char)},
    ani_native_function {"test_Class_SetStaticField_Byte", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Byte)},
    ani_native_function {"test_Class_SetStaticField_Short", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Short)},
    ani_native_function {"test_Class_SetStaticField_Int", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Int)},
    ani_native_function {"test_Class_SetStaticField_Long", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Long)},
    ani_native_function {"test_Class_SetStaticField_Float", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Float)},
    ani_native_function {"test_Class_SetStaticField_Double", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Double)},
    ani_native_function {"test_Class_SetStaticField_Ref", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticField_Ref)},
    ani_native_function {"test_Class_GetStaticFieldByName_Boolean", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Boolean)},
    ani_native_function {"test_Class_GetStaticFieldByName_Char", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Char)},
    ani_native_function {"test_Class_GetStaticFieldByName_Byte", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Byte)},
    ani_native_function {"test_Class_GetStaticFieldByName_Short", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Short)},
    ani_native_function {"test_Class_GetStaticFieldByName_Int", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Int)},
    ani_native_function {"test_Class_GetStaticFieldByName_Long", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Long)},
    ani_native_function {"test_Class_GetStaticFieldByName_Float", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Float)},
    ani_native_function {"test_Class_GetStaticFieldByName_Double", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Double)},
    ani_native_function {"test_Class_GetStaticFieldByName_Ref", ":Z",
                         reinterpret_cast<void *>(test_Class_GetStaticFieldByName_Ref)},
    ani_native_function {"test_Class_SetStaticFieldByName_Boolean", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Boolean)},
    ani_native_function {"test_Class_SetStaticFieldByName_Char", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Char)},
    ani_native_function {"test_Class_SetStaticFieldByName_Byte", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Byte)},
    ani_native_function {"test_Class_SetStaticFieldByName_Short", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Short)},
    ani_native_function {"test_Class_SetStaticFieldByName_Int", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Int)},
    ani_native_function {"test_Class_SetStaticFieldByName_Long", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Long)},
    ani_native_function {"test_Class_SetStaticFieldByName_Float", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Float)},
    ani_native_function {"test_Class_SetStaticFieldByName_Double", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Double)},
    ani_native_function {"test_Class_SetStaticFieldByName_Ref", ":Z",
                         reinterpret_cast<void *>(test_Class_SetStaticFieldByName_Ref)},
    ani_native_function {"test_Class_CallStaticMethodByName_Boolean", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Boolean)},
    ani_native_function {"test_Class_CallStaticMethodByName_Boolean_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Boolean_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Boolean_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Boolean_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Char", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Char)},
    ani_native_function {"test_Class_CallStaticMethodByName_Char_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Char_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Char_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Char_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Byte", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Byte)},
    ani_native_function {"test_Class_CallStaticMethodByName_Byte_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Byte_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Byte_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Byte_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Short", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Short)},
    ani_native_function {"test_Class_CallStaticMethodByName_Short_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Short_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Short_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Short_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Int", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Int)},
    ani_native_function {"test_Class_CallStaticMethodByName_Int_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Int_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Int_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Int_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Long", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Long)},
    ani_native_function {"test_Class_CallStaticMethodByName_Long_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Long_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Long_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Long_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Float", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Float)},
    ani_native_function {"test_Class_CallStaticMethodByName_Float_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Float_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Float_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Float_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Double", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Double)},
    ani_native_function {"test_Class_CallStaticMethodByName_Double_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Double_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Double_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Double_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Ref", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Ref)},
    ani_native_function {"test_Class_CallStaticMethodByName_Ref_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Ref_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Ref_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Ref_V)},
    ani_native_function {"test_Class_CallStaticMethodByName_Void", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Void)},
    ani_native_function {"test_Class_CallStaticMethodByName_Void_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Void_A)},
    ani_native_function {"test_Class_CallStaticMethodByName_Void_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethodByName_Void_V)},
    ani_native_function {"test_Class_CallStaticMethod_Short", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethod_Short)},
    ani_native_function {"test_Class_CallStaticMethod_Short_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethod_Short_A)},
    ani_native_function {"test_Class_CallStaticMethod_Short_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethod_Short_V)},
    ani_native_function {"test_Class_CallStaticMethod_Int", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethod_Int)},
    ani_native_function {"test_Class_CallStaticMethod_Int_A", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethod_Int_A)},
    ani_native_function {"test_Class_CallStaticMethod_Int_V", ":Z",
                         reinterpret_cast<void *>(test_Class_CallStaticMethod_Int_V)},
};
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return (ani_status)ANI_RES_OUT_OF_REF;
    }

    ani_class cls {};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '"<< clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_ARGS;
    }
    
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '"<< clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_TYPE;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "Lentry/src/main/src/ets/Index/Foo;");
    *result = ANI_VERSION_1;
    return ANI_OK;
}