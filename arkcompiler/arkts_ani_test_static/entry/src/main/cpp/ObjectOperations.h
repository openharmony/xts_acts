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
#endif //ARKTS_ANI_TEST_OBJECTOPERATIONS_H
