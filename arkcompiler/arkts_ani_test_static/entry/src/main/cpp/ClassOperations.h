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

#ifndef ARKTS_ANI_TEST_CLASSOPERATIONS_H
#define ARKTS_ANI_TEST_CLASSOPERATIONS_H
#include "Common.h"

ani_boolean test_FindClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("Lentry/src/main/src/ets/Index/Foo;", &cls);

    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethod([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("Lentry/src/main/src/ets/Index/Foo;", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "or", "ZZ:Z", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_CLASSOPERATIONS_H
