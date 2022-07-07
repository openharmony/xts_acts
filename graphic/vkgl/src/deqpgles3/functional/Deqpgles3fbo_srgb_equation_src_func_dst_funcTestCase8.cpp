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
#include "../ActsDeqpgles30030TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_dst_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030050 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_one_minus_dst_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030051 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030052 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030053 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030054 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030055 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030056 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030057 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030058 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030059 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030060 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_dst_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030061 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_dst_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030062 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_dst_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030063 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_dst_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030064 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030065 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_constant_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030066 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_constant_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030067 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030068 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030069 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030070 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030071 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030072 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030073 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030074 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030075 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_constant_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030076 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_constant_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030077 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_constant_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030078 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_constant_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030079 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_"
        "func_dst_func.reverse_subtract_constant_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030080 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_constant_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030081 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_constant_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030082 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030083 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030084 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030085 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030086 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030087 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030088 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030089 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030090 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_constant_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030091 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst"
        "_func.reverse_subtract_one_minus_constant_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030092 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_constant_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030093 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst"
        "_func.reverse_subtract_one_minus_constant_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030094 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_"
        "dst_func.reverse_subtract_one_minus_constant_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030095 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_constant_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030096 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_constant_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030097 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030098 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030099 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030100 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030101 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030102 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030103 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_constant_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030104 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030105 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_constant_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030106 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_constant_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030107 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_constant_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030108 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_constant_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030109 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_"
        "func_dst_func.reverse_subtract_constant_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030110 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_constant_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030111 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_constant_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030112 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030113 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030114 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030115 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030116 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030117 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030118 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030119 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030120 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_constant_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030121 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst"
        "_func.reverse_subtract_one_minus_constant_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030122 end";
}
