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

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029904, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029904 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029904 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029904 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029905, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029905 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_alpha_saturate_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029905 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029905 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029906, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029906 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029906 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029906 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029907, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029907 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_alpha_saturate_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029907 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029907 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029908, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029908 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029908 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029908 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029909, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029909 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_alpha_saturate_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029909 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029909 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029910, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029910 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029910 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029910 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029911, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029911 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.subtract_src_alpha_saturate_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029911 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029911 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029912, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029912 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.subtract_src_alpha_saturate_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029912 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029912 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029913, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029913 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.subtract_src_alpha_saturate_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029913 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029913 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029914, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029914 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.subtract_src_alpha_saturate_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029914 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029914 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029915, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029915 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.subtract_src_alpha_saturate_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029915 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029915 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029916, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029916 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e"
        "quation_src_func_dst_func.reverse_subtract_zero_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029916 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029916 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029917, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029917 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e"
        "quation_src_func_dst_func.reverse_subtract_zero_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029917 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029917 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029918, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029918 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.reverse_subtract_zero_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029918 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029918 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029919, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029919 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_zero_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029919 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029919 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029920, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029920 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.reverse_subtract_zero_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029920 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029920 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029921, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029921 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_zero_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029921 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029921 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029922, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029922 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.reverse_subtract_zero_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029922 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029922 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029923, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029923 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_zero_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029923 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029923 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029924, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029924 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.reverse_subtract_zero_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029924 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029924 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029925, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029925 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_zero_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029925 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029925 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029926, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029926 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_zero_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029926 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029926 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029927, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029927 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_zero_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029927 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029927 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_zero_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029928 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_zero_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029929 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029930, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029930 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_zero_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029930 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029930 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029931, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029931 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e"
        "quation_src_func_dst_func.reverse_subtract_one_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029931 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029931 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.reverse_subtract_one_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029932 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029933, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029933 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ"
        "ation_src_func_dst_func.reverse_subtract_one_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029933 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029933 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029934, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029934 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029934 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029934 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029935, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029935 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ"
        "ation_src_func_dst_func.reverse_subtract_one_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029935 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029935 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029936, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029936 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029936 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029936 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029937, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029937 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ"
        "ation_src_func_dst_func.reverse_subtract_one_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029937 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029937 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029938, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029938 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029938 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029938 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029939, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029939 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ"
        "ation_src_func_dst_func.reverse_subtract_one_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029939 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029939 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029940, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029940 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029940 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029940 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029941, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029941 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_one_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029941 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029941 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029942, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029942 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029942 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029942 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029943, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029943 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_one_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029943 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029943 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029944, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029944 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029944 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029944 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029945, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029945 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029945 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029945 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029946, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029946 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.reverse_subtract_src_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029946 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029946 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029947, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029947 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ"
        "ation_src_func_dst_func.reverse_subtract_src_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029947 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029947 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029948, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029948 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_src_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029948 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029948 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029949, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029949 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_src_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029949 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029949 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029950, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029950 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_src_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029950 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029950 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029951, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029951 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_src_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029951 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029951 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029952, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029952 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_src_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029952 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029952 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029953, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029953 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_src_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029953 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029953 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029954, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029954 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati"
        "on_src_func_dst_func.reverse_subtract_src_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029954 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029954 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029955, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029955 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_src_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029955 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029955 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029956, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029956 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_src_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029956 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029956 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_src_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029957 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_src_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029958 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_src_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029959 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_src_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029960 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.reverse_subtract_one_minus_src_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029961 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation"
        "_src_func_dst_func.reverse_subtract_one_minus_src_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029962 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_src_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029963 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029964 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_src_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029965 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029966 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_src_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029967 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029968 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr"
        "c_func_dst_func.reverse_subtract_one_minus_src_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029969 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029970 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_src_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029971 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_src_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029972 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f"
        "unc_dst_func.reverse_subtract_one_minus_src_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029973 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d"
        "st_func.reverse_subtract_one_minus_src_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029974 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun"
        "c_dst_func.reverse_subtract_one_minus_src_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029975 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.reverse_subtract_dst_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029976 end";
}
