/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015116,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic",
        "_array_assign_partial.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015117,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_",
        "array_assign_partial.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015118,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basi",
        "c_array_assign_partial.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015119,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic",
        "_array_assign_partial.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015120,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_",
        "array_assign_partial.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015121,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basi",
        "c_array_assign_partial.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015122,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic",
        "_array_assign_partial.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015123,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_",
        "array_assign_partial.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015124,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basi",
        "c_array_assign_partial.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015125,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic",
        "_array_assign_partial.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015126,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_",
        "array_assign_partial.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015127,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basi",
        "c_array_assign_partial.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015128,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_array",
        "_assign_partial.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015129,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_array_",
        "assign_partial.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015130,
        "dEQP-GLES2.functional.uniform_api.value.assigned.basic_arra",
        "y_assign_partial.array_in_struct.sampler2D_samplerCube_both");
