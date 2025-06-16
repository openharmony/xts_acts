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

#ifndef ARKTS_ANI_TEST_COMMON_H
#define ARKTS_ANI_TEST_COMMON_H
#include <cstdio>
#include <array>
#include <iostream>
#include "ani/ani.h"
#include "hilog/log.h"

const uint32_t ANI_RES_INVALID_ARGS = 2;
const uint32_t ANI_RES_INVALID_TYPE = 3;
const uint32_t ANI_RES_OUT_OF_REF = 9;

#define ASSERT_EQ(a, b) \
    do { \
        if ((a) != (b)) { \
            OH_LOG_INFO(LOG_APP, "Assertion failed at %{public}s : %{public}s", __FILE__, __LINE__); \
            OH_LOG_INFO(LOG_APP, "strval1: {public}s & strval2: {public}s,", (a), (b)); \
            return ANI_FALSE; \
        } \
    } while (0)

#define ASSERT_NE(a, b) \
    do { \
        if ((a) == (b)) { \
            OH_LOG_INFO(LOG_APP, "Assertion failed at %{public}s : %{public}s", __FILE__, __LINE__); \
            OH_LOG_INFO(LOG_APP, "strval1: {public}s & strval2: {public}s,", (a), (b)); \
            return ANI_FALSE; \
        } \
    } while (0)

void GetClsData(ani_env *env, ani_object *objectResult, ani_class *outCls)
{
    ani_class cls {};
    if (env->FindClass("Lentry/src/main/src/ets/Index/Foo;", &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed");
    }
    if (cls == nullptr) {
        OH_LOG_INFO(LOG_APP, " FindClass cls is nullptr");
    }

    ani_static_method newMethod;
    if (env->Class_FindStaticMethod(cls, "new_Foo", ":Lentry/src/main/src/ets/Index/Foo;", &newMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_FindStaticMethod Failed");
        return;
    }

    ani_ref ref;
    if (env->Class_CallStaticMethod_Ref(cls, newMethod, &ref) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_CallStaticMethod_Ref Failed");
        return;
    }

    *objectResult = static_cast<ani_object>(ref);
    *outCls = cls;
}
#endif //ARKTS_ANI_TEST_COMMON_H
