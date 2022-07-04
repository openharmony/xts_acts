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

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003377 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003378 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.basic_lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003379 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.basic_lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003380 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003381 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003382 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003383 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003384 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003385 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003386 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003387 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003388 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.fo"
        "r_uniform_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003389 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_uniform_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003390 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uniform_iter"
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
        GTEST_LOG_(INFO) << "TestCase_003391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003391 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uniform_itera"
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
        GTEST_LOG_(INFO) << "TestCase_003392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003392 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uniform_iter"
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
        GTEST_LOG_(INFO) << "TestCase_003393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003393 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uniform_itera"
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
        GTEST_LOG_(INFO) << "TestCase_003394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003394 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uniform_"
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
        GTEST_LOG_(INFO) << "TestCase_003395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003395 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uniform_i"
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
        GTEST_LOG_(INFO) << "TestCase_003396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003396 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003397 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003398 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003399 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003400 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003401 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003402 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_uniform_iterations.no_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003403 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.no_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003404 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003405 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003406 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unif"
        "orm_iterations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003407 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unifo"
        "rm_iterations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003408 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003409 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unif"
        "orm_iterations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003410 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unif"
        "orm_iterations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003411 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unifo"
        "rm_iterations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003412 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_uniform_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003413 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003414 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003415 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003416 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003417 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003418 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003419 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003420 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for"
        "_uniform_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003421 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003422 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003423 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003424 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003425 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unif"
        "orm_iterations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003426 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003427 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003428 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003429 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003430 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.f"
        "or_uniform_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003431 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003432 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.fo"
        "r_uniform_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003432 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003432 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003433 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops."
        "for_uniform_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003433 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003433 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003434 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.f"
        "or_uniform_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003434 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003434 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003435 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_"
        "uniform_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003435 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003435 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003436 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003436 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003436 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unifo"
        "rm_iterations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003437 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unifor"
        "m_iterations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003438 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unifo"
        "rm_iterations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003439 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unifor"
        "m_iterations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003440 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_u"
        "niform_iterations.conditional_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003441 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.conditional_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003442 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.function_call_return_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003443 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_unif"
        "orm_iterations.function_call_return_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003444 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_un"
        "iform_iterations.function_call_inout_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003445 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.loops.for_uni"
        "form_iterations.function_call_inout_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003446 end";
}
