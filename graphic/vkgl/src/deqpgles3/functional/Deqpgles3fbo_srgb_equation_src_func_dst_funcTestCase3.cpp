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

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.add_src_alpha_saturate_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029685 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_src_alpha_saturate_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029686 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.add_src_alpha_saturate_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029687 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_src_alpha_saturate_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029688 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.add_src_alpha_saturate_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029689 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.add_src_alpha_saturate_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029690 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.subtract_zero_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029691 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.subtract_zero_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029692 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.subtract_zero_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029693 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_zero_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029694 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.subtract_zero_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029695 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_zero_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029696 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.subtract_zero_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029697 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_zero_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029698 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.subtract_zero_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029699 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_zero_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029700 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_zero_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029701 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_zero_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029702 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_zero_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029703 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_zero_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029704 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_zero_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029705 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.subtract_one_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029706 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s"
        "rgb.equation_src_func_dst_func.subtract_one_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029707 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.subtract_one_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029708 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_one_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029709 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.subtract_one_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029710 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_one_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029711 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.subtract_one_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029712 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_one_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029713 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.subtract_one_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029714 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_one_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029715 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_one_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029716 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_one_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029717 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_one_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029718 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_one_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029719 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_one_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029720 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.subtract_src_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029721 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.subtract_src_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029722 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_src_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029723 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029724 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_src_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029725 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029726 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_src_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029727 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029728 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_src_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029729 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029730 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_src_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029731 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.subtract_src_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029732 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_src_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029733 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.subtract_src_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029734 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_src_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029735 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.subtract_one_minus_src_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029736 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.subtract_one_minus_src_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029737 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029738 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_one_minus_src_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029739 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029740 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_one_minus_src_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029741 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029742 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_one_minus_src_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029743 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029744 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_one_minus_src_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029745 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.subtract_one_minus_src_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029746 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu"
        "nc_dst_func.subtract_one_minus_src_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029747 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.subtract_one_minus_src_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029748 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu"
        "nc_dst_func.subtract_one_minus_src_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029749 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.subtract_one_minus_src_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029750 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.subtract_dst_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029751 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.subtract_dst_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029752 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_dst_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029753 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_dst_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029754 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_dst_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029755 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.subtract_dst_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029756 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.subtract_dst_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029757 end";
}
