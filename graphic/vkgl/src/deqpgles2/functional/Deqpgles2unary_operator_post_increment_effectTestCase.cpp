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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20005TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004126 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004127 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004128 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_increment_effect.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004129 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004130 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004131 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004132, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004132 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004132 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004132 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004133, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004133 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004133 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004133 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004134, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004134 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004134 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004134 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004135 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004136 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004137 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004138, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004138 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004138 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004138 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004139, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004139 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004139 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004139 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004140 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004141 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004142 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004143 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004144 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004145 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004146 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004147 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004148 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004149 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.post_increment_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004150 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004151 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004152, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004152 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004152 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004152 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004153, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004153 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004153 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004153 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004154, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004154 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004154 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004154 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004155, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004155 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004155 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004155 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004156, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004156 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004156 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004156 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004157, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004157 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004157 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004157 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004158, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004158 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004158 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004158 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004159, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004159 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_increment_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004159 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004159 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004160, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004160 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004160 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004160 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004161, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004161 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004161 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004161 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004162, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004162 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004162 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004162 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004163, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004163 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004163 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004163 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004164, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004164 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004164 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004164 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004165, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004165 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_increment_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004165 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004165 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004166, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004166 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004166 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004166 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004167, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004167 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004167 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004167 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004168, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004168 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_increment_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004168 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004168 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004169, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004169 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004169 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004169 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004170, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004170 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004170 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004170 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004171, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004171 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_increment_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004171 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004171 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004172, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004172 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_increment_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004172 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004172 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004173, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004173 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_increment_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004173 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004173 end";
}
