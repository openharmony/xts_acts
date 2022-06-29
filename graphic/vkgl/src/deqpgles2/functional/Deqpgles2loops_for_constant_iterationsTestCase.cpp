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
#include "../ActsDeqpgles20004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003307 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003308 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.basic_lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003309 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.basic_lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003310 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003311 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003312 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003313 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003314 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003315 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003316 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003317 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003318 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.fo"
        "r_constant_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003319 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_constant_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003320 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_constant_iter"
        "ations.infinite_with_unconditional_break_first_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003321 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_constant_itera"
        "tions.infinite_with_unconditional_break_first_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003322 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_constant_ite"
        "rations.infinite_with_unconditional_break_last_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003323 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_constant_iter"
        "ations.infinite_with_unconditional_break_last_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003324 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_constant_"
        "iterations.infinite_with_conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003325 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_constant_i"
        "terations.infinite_with_conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003326 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003327 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003328 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003329 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003330 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003331 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003332 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.no_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003333 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.no_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003334 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003335 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003336 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003337 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_const"
        "ant_iterations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003338 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003339, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003339 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003339 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003339 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003340, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003340 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003340 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003340 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003341, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003341 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003341 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003341 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003342, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003342 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_const"
        "ant_iterations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003342 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003342 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003343, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003343 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003343 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003343 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003344, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003344 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003344 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003344 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003345, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003345 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003345 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003345 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003346, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003346 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003346 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003346 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003347, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003347 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003347 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003347 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003348, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003348 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003348 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003348 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003349, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003349 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003349 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003349 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003350, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003350 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003350 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003350 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003351, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003351 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003351 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003351 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003352, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003352 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003352 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003352 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003353, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003353 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003353 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003353 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003354, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003354 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003354 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003354 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003355, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003355 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003355 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003355 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003356, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003356 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003356 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003356 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003357, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003357 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003357 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003357 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003358 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "constant_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003359 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003360, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003360 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003360 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003360 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.f"
        "or_constant_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003361 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.fo"
        "r_constant_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003362 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops."
        "for_constant_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003363 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.f"
        "or_constant_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003364 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003365 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003366 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_const"
        "ant_iterations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003367 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_consta"
        "nt_iterations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003368 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_const"
        "ant_iterations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003369 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_consta"
        "nt_iterations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003370 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_c"
        "onstant_iterations.conditional_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003371 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_co"
        "nstant_iterations.conditional_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003372 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.function_call_return_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003373 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.function_call_return_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003374 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_con"
        "stant_iterations.function_call_inout_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003375 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_cons"
        "tant_iterations.function_call_inout_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003376 end";
}
