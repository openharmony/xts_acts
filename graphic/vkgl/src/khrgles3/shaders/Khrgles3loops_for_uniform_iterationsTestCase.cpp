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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000388 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000389 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000390 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000391 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000392 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_i"
        "terations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000393 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000394 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000395 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000396 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000397 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unif"
        "orm_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000398 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifo"
        "rm_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000399 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iterations"
        ".infinite_with_unconditional_break_first_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000400 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iterations."
        "infinite_with_unconditional_break_first_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000401 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iterations"
        ".infinite_with_unconditional_break_last_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000402 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iterations."
        "infinite_with_unconditional_break_last_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000403 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iterat"
        "ions.infinite_with_conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000404 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iterati"
        "ons.infinite_with_conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000405 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000406 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000407 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000408 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_i"
        "terations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000409 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000410 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_i"
        "terations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000411 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifo"
        "rm_iterations.no_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000412 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.no_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000413 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000414 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000415 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_it"
        "erations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000416 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_ite"
        "rations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000417 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_i"
        "terations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000418 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_it"
        "erations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000419 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_it"
        "erations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000420 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_ite"
        "rations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000421 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifo"
        "rm_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000422 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000423 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000424 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000425 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000426 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000427 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_"
        "iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000428 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_i"
        "terations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000429 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifo"
        "rm_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000430 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000431 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000432 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000432 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000432 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000433 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000433 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000433 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000434 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_i"
        "terations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000434 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000434 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000435 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_it"
        "erations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000435 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000435 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000436 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000436 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000436 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000437 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000438 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000439 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uni"
        "form_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000440 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unif"
        "orm_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000441 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_un"
        "iform_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000442 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uni"
        "form_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000443 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_unifor"
        "m_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000444 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform"
        "_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000445 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_ite"
        "rations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000446 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iter"
        "ations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000447 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_ite"
        "rations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000448 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_uniform_iter"
        "ations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000449 end";
}
