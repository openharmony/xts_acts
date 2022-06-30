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

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004222, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004222 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004222 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004222 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004223, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004223 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004223 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004223 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004224 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004225 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004226 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004227 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_increment_result.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004228 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004229 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004230 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004231 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004232 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004233 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_increment_result.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004234 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004235 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004236 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004237 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004238 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004239 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_increment_result.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004240 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004241 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004242 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004243 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004244 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004245 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_increment_result.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004246 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004247 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004248 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004249 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_increment_result.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004250 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004251 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004252 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004253 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004254 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004255 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004256 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004257 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004258 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004259 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004260 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004261 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004262 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004263 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004264 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004265 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004266 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_increment_result.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004267 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_increment_result.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004268 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_increment_result.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004269 end";
}
