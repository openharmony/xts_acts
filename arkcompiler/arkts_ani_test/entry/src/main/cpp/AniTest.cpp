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

#include "ani/ani.h"
#include <array>
#include <iostream>
const uint32_t ANI_RES_INVALID_ARGS = 2;
const uint32_t ANI_RES_INVALID_TYPE = 3;
const uint32_t ANI_RES_OUT_OF_REF = 9;


static ani_int add([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int arg1, ani_int arg2)
{
    return arg1 + arg2;
}

static ani_int test_GetVersion([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    uint32_t aniVersion = 0;
    env->GetVersion(&aniVersion);
    return (ani_int)aniVersion;
}

static ani_boolean test_FindClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean res = false;
    ani_class cls = nullptr;
    auto status = env->FindClass("Lentry/src/main/src/ets/Index/Calc;", &cls);
    if (status == ANI_OK && cls != nullptr) {
        res = true;
    }
    return res;
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

    std::array methods = {
        ani_native_function {"add", "II:I", reinterpret_cast<void *>(add)},
        ani_native_function {"test_GetVersion", ":I", reinterpret_cast<void *>(test_GetVersion)},
        ani_native_function {"test_FindClass", ":Z", reinterpret_cast<void *>(test_FindClass)},
    };
    
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '"<< clsName << "'" << std::endl;
        return (ani_status)ANI_RES_INVALID_TYPE;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "Lentry/src/main/src/ets/Index/Calc;");
    *result = ANI_VERSION_1;
    return ANI_OK;
}