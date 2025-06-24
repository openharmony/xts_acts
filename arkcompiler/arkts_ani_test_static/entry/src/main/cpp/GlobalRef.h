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

#ifndef ARKTS_ANI_TEST_GLOBALREF_H
#define ARKTS_ANI_TEST_GLOBALREF_H
#include "Common.h"
ani_int test_GlobalReference_Create([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref objectRef;
    ASSERT_EQ(env->String_NewUTF8("x", 1, reinterpret_cast<ani_string *>(&objectRef)), ANI_OK);
    ani_ref objectGRef;
    ASSERT_EQ(env->GlobalReference_Create(objectRef, &objectGRef), ANI_OK);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_GLOBALREF_H
