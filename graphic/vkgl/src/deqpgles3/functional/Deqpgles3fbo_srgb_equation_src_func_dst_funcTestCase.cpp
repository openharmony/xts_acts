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

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_"
        "srgb.equation_src_func_dst_func.add_zero_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029466 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo"
        "_srgb.equation_src_func_dst_func.add_zero_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029467 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_zero_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029468 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_zero_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029469 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_zero_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029470 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_zero_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029471 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_zero_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029472 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_zero_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029473 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_zero_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029474 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_zero_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029475 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_zero_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029476 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_zero_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029477 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_zero_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029478 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_zero_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029479 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_zero_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029480 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo"
        "_srgb.equation_src_func_dst_func.add_one_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029481 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo"
        "_srgb.equation_src_func_dst_func.add_one_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029482 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_one_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029483 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_one_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029484 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_one_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029485 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_one_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029486 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_one_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029487 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_one_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029488 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_one_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029489 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_one_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029490 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.add_one_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029491 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.add_one_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029492 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb"
        ".equation_src_func_dst_func.add_one_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029493 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.add_one_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029494 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e"
        "quation_src_func_dst_func.add_one_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029495 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_src_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029496 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_src_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029497 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_src_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029498 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_src_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029499 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_src_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029500 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_src_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029501 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_src_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029502 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_src_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029503 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_src_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029504 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_src_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029505 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_src_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029506 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_src_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029507 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_src_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029508 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_src_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029509 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa"
        "tion_src_func_dst_func.add_src_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029510 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_one_minus_src_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029511 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_one_minus_src_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029512 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_one_minus_src_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029513 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.add_one_minus_src_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029514 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_one_minus_src_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029515 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.add_one_minus_src_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029516 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_one_minus_src_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029517 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.add_one_minus_src_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029518 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_one_minus_src_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029519 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s"
        "rc_func_dst_func.add_one_minus_src_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029520 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_one_minus_src_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029521 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.add_one_minus_src_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029522 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029523, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029523 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_one_minus_src_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029523 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029523 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029524, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029524 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src"
        "_func_dst_func.add_one_minus_src_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029524 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029524 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029525, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029525 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_"
        "src_func_dst_func.add_one_minus_src_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029525 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029525 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029526, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029526 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_dst_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029526 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029526 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029527, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029527 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr"
        "gb.equation_src_func_dst_func.add_dst_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029527 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029527 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029528, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029528 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_dst_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029528 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029528 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029529, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029529 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_dst_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029529 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029529 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029530, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029530 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_dst_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029530 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029530 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029531, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029531 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_dst_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029531 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029531 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_dst_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029532 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_dst_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029533 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb."
        "equation_src_func_dst_func.add_dst_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029534 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat"
        "ion_src_func_dst_func.add_dst_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029535 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_dst_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029536 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio"
        "n_src_func_dst_func.add_dst_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029537 end";
}

static HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_029538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq"
        "uation_src_func_dst_func.add_dst_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30030TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30030TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30030TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30030TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30030TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_029538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_029538 end";
}
