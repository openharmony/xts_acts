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
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006496,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006497,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.reflect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006498,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.reflect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006499,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006500,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006501,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.reflect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006502,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.reflect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006503,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006504,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006505,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.reflect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006506,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.reflect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006507,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006508,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006509,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.reflect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006510,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.reflect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006511,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.reflect.highp_vec4_fragment");
