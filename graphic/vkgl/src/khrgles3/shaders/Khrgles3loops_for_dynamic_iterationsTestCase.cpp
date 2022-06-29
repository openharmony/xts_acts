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

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000450 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000451 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000452 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000453 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000454 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_000455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000455 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000456 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000457 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000458 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000459 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dyna"
        "mic_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000460 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynam"
        "ic_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000461 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iterations"
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
        GTEST_LOG_(INFO) << "TestCase_000462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000462 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iterations."
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
        GTEST_LOG_(INFO) << "TestCase_000463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000463 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iterations"
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
        GTEST_LOG_(INFO) << "TestCase_000464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000464 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iterations."
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
        GTEST_LOG_(INFO) << "TestCase_000465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000465 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iterat"
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
        GTEST_LOG_(INFO) << "TestCase_000466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000466 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iterati"
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
        GTEST_LOG_(INFO) << "TestCase_000467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000467 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000468 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000469 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000470 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_000471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000471 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000472 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_000473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000473 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynam"
        "ic_iterations.no_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000474 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.no_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000475 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000476 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000477 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_it"
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
        GTEST_LOG_(INFO) << "TestCase_000478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000478 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_ite"
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
        GTEST_LOG_(INFO) << "TestCase_000479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000479 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_000480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000480 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_it"
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
        GTEST_LOG_(INFO) << "TestCase_000481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000481 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_it"
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
        GTEST_LOG_(INFO) << "TestCase_000482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000482 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_ite"
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
        GTEST_LOG_(INFO) << "TestCase_000483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000483 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynam"
        "ic_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000484 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000485 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000486 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000487 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000488 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000489 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_"
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
        GTEST_LOG_(INFO) << "TestCase_000490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000490 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_000491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000491 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynam"
        "ic_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000492 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000493 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000494 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000495 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_i"
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
        GTEST_LOG_(INFO) << "TestCase_000496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000496 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_it"
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
        GTEST_LOG_(INFO) << "TestCase_000497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000497 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000498 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000499 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000500 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000501 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dyn"
        "amic_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000502 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dyna"
        "mic_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000503 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dy"
        "namic_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000504 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dyn"
        "amic_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000505 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynami"
        "c_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000506 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic"
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
        GTEST_LOG_(INFO) << "TestCase_000507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000507 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_ite"
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
        GTEST_LOG_(INFO) << "TestCase_000508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000508 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iter"
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
        GTEST_LOG_(INFO) << "TestCase_000509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000509 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_ite"
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
        GTEST_LOG_(INFO) << "TestCase_000510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000510 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.for_dynamic_iter"
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
        GTEST_LOG_(INFO) << "TestCase_000511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000511 end";
}
