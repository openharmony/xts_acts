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
#include "../ActsDeqpgles30018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017550,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017551,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017552,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017553,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017554,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017555,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017556,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdx.texture.msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017557,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.texture.msaa4.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017731,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017732,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017733,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017734,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017735,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017736,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017737,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.dfdy.texture.msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017738,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdy.texture.msaa4.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017935,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.msaa4.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017936,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.msaa4.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017937,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.msaa4.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017938,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.msaa4.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017939,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.msaa4.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017940,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.msaa4.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017941,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.texture.msaa4.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017942,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.texture.msaa4.vec4_highp");
