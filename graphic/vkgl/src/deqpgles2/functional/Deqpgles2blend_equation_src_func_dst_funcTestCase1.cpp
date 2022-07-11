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
#include "../ActsDeqpgles20012TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011225 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011226 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011227 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011228 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011229 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011230 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011231 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_one_minus_dst_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011232 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func"
        "_dst_func.add_one_minus_dst_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011233 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_one_minus_dst_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011234 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func"
        "_dst_func.add_one_minus_dst_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011235 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.eq"
        "uation_src_func_dst_func.add_src_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011236 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.e"
        "quation_src_func_dst_func.add_src_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011237 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_src_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011238 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_src_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011239 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_src_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011240 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_src_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011241 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_src_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011242 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_src_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011243 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_src_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011244 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_src_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011245 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_src_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011246 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_src_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011247 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_src_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011248 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_src_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011249 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_one_minus_src_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011250 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equati"
        "on_src_func_dst_func.add_one_minus_src_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011251 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_src_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011252 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_src_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011253 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_src_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011254 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_src_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011255 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_src_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011256 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_src_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011257 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_src_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011258 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_src_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011259 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_one_minus_src_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011260 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func"
        "_dst_func.add_one_minus_src_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011261 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_one_minus_src_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011262 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func"
        "_dst_func.add_one_minus_src_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011263 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.eq"
        "uation_src_func_dst_func.add_dst_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011264 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.e"
        "quation_src_func_dst_func.add_dst_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011265 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_dst_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011266 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_dst_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011267 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_dst_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011268 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_dst_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011269 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_dst_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011270 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_dst_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011271 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_dst_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011272 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_dst_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011273 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_dst_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011274 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_dst_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011275 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_dst_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011276 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_dst_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011277 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_one_minus_dst_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011278 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equati"
        "on_src_func_dst_func.add_one_minus_dst_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011279 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011280 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011281 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011282 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011283 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011284 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011285 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_"
        "src_func_dst_func.add_one_minus_dst_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011286 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f"
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011287 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_one_minus_dst_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011288 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func"
        "_dst_func.add_one_minus_dst_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011289 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_one_minus_dst_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011290 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func"
        "_dst_func.add_one_minus_dst_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011291 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_constant_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011292 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equa"
        "tion_src_func_dst_func.add_constant_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011293 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_constant_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011294 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_constant_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011295 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equatio"
        "n_src_func_dst_func.add_constant_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011296 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src"
        "_func_dst_func.add_constant_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011297 end";
}
