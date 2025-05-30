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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013326,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013327,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.normalize.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013328,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.normalize.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013329,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013330,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013331,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.normalize.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013332,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.normalize.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013333,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013334,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013335,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.normalize.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013336,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.normalize.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013337,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013338,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013339,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.normalize.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013340,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.normalize.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013341,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.normalize.highp_vec4_fragment");
