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

#include <gtest/gtest.h>
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30008TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007358 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007359 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007360, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007360 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007360 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007360 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007361 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007362 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007363 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007364 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007365 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007366 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007367 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007368 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007369 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007370 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007371 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007372 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007373 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007374 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007375 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007376 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007377 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007378 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007379 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007380 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007381 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.minus.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007382 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007383 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007384 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007385 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007386 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007387 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007388 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007389 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007390 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007391 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007392 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007393 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007394 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007395 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007396 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007397 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007398 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007399 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007400 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007401 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007402 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007403 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007404 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007405 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007406 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007407 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007408 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007409 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007410 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007411 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007412 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007413 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007414 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007415 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007416 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007417 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007418 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007419 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007420 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.un"
        "ary_operator.minus.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007421 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.minus.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007422 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007423 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007424 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007425 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007426 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007427 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.minus.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007428 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.minus.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007429 end";
}
