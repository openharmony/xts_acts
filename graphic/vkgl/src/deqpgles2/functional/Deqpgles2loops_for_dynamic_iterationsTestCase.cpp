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

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003447 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003448 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.basic_lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003449 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.basic_lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003450 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003451 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003452 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003453 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003454 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003455 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003456 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003457 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003458 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.fo"
        "r_dynamic_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003459 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_dynamic_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003460 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_iter"
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
        GTEST_LOG_(INFO) << "TestCase_003461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003461 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_itera"
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
        GTEST_LOG_(INFO) << "TestCase_003462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003462 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_iter"
        "ations.infinite_with_unconditional_break_last_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003463 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_itera"
        "tions.infinite_with_unconditional_break_last_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003464 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_003465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003465 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_003466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003466 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003467 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003468 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003469 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003470 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003471 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003472 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_dynamic_iterations.no_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003473 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.no_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003474 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003475 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003476 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyna"
        "mic_iterations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003477 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynam"
        "ic_iterations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003478 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003479 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyna"
        "mic_iterations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003480 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyna"
        "mic_iterations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003481 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynam"
        "ic_iterations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003482 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_dynamic_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003483 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003484 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003485 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003486 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003487 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003488 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003489 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003490 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_dynamic_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003491 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003492 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003493 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003494 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003495 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyna"
        "mic_iterations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003496 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003497 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003498 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003499 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003500 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.f"
        "or_dynamic_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003501 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.fo"
        "r_dynamic_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003502 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops."
        "for_dynamic_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003503 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.f"
        "or_dynamic_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003504 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "dynamic_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003505 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003506 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynam"
        "ic_iterations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003507 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynami"
        "c_iterations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003508 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynam"
        "ic_iterations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003509 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dynami"
        "c_iterations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003510 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_d"
        "ynamic_iterations.conditional_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003511 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.conditional_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003512 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.function_call_return_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003513 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyna"
        "mic_iterations.function_call_return_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003514 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dy"
        "namic_iterations.function_call_inout_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003515 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_dyn"
        "amic_iterations.function_call_inout_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003516 end";
}
