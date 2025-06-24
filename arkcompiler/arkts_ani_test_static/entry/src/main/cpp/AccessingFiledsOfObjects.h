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

#ifndef ARKTS_ANI_TEST_ACCESSINGFILEDSOFOBJECTS_H
#define ARKTS_ANI_TEST_ACCESSINGFILEDSOFOBJECTS_H
#include "Common.h"
ani_int test_Object_GetFieldByName_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    ani_object obj = {};
    ASSERT_EQ(GetClsData(env, &obj, &cls), ANI_TRUE);

    ani_ref strRef {};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "stringValue", &strRef), ANI_OK);
    ASSERT_NE(strRef, nullptr);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_ACCESSINGFILEDSOFOBJECTS_H
