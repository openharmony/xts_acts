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

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007448 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007449 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007450 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007451 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007452 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007453 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.pre_increment_effect.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007454 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007455 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007456 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007457 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007458 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007459 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.pre_increment_effect.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007460 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007461 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007462 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007463 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007464 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007465 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.pre_increment_effect.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007466 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007467 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007468 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007469 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007470 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007471 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.pre_increment_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007472 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007473 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007474 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007475 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.pre_increment_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007476 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007477 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007478 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007479 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007480 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007481 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007482 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007483 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007484 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007485 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007486 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007487 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007488 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007489 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007490 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007491 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007492 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007493 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007494 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007495 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_"
        "operator.pre_increment_effect.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007496 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007497 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007498 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007499 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007500 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007501 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007502 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007503 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007504 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007505 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007506 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007507 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007508 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007509 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007510 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007511 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007512 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007513 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007514 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007515 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007516 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_ope"
        "rator.pre_increment_effect.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007517 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_o"
        "perator.pre_increment_effect.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007518 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.unary_op"
        "erator.pre_increment_effect.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007519 end";
}
