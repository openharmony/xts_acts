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

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007664 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007665 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007666 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007667 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007668 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007669 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007670 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007671 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007672 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007673 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007674 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007675 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007676 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007677 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007678 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007679 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007680 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007681 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007682 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007683 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007684 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007685 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007686 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007687 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.post_decrement_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007688 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007689 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007690 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007691 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007692 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007693 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007694 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007695 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007696 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007697 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007698 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007699 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007700 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007701 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007702 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007703 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007704 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007705 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007706 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007707 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007708 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007709 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007710 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007711 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007712 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007713 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007714 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007715 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007716 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007717 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007718 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007719 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007720 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007721 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007722 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007723 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007724 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007725 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007726 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007727 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007728 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007729 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007730 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007731 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007732 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007733 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007734 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007735 end";
}
