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
#include "../ActsDeqpgles30029TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028606, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028606 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_dst_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028606 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028606 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028607, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028607 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_dst_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028607 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028607 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028608, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028608 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_dst_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028608 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028608 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028609, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028609 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_dst_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028609 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028609 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028610, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028610 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_dst_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028610 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028610 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028611, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028611 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_dst_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028611 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028611 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028612, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028612 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_dst_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028612 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028612 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e"
        "quation_src_func_dst_func.subtract_dst_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028613 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_one_minus_dst_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028614 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_one_minus_dst_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028615 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_dst_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028616 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028617, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028617 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028617 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028617 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028618, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028618 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_dst_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028618 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028618 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028619, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028619 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028619 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028619 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028620, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028620 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_dst_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028620 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028620 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028621, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028621 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028621 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028621 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028622, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028622 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_dst_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028622 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028622 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028623 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_one_minus_dst_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028624 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_"
        "src_func_dst_func.subtract_one_minus_dst_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028625 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_one_minus_dst_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028626 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_"
        "src_func_dst_func.subtract_one_minus_dst_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028627 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati"
        "on_src_func_dst_func.subtract_one_minus_dst_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028628 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb"
        "uffer.equation_src_func_dst_func.subtract_src_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028629 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb"
        "uffer.equation_src_func_dst_func.subtract_src_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028630 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_src_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028631 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028632 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_src_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028633 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028634 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_src_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028635 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028636 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_src_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028637 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028638 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_src_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028639 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_src_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028640 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_src_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028641 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_src_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028642 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e"
        "quation_src_func_dst_func.subtract_src_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028643 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_one_minus_src_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028644 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_one_minus_src_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028645 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028646 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028647 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028648 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028649 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028650 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028651 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028652 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028653 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_one_minus_src_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028654 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_"
        "src_func_dst_func.subtract_one_minus_src_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028655 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_one_minus_src_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028656 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_"
        "src_func_dst_func.subtract_one_minus_src_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028657 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati"
        "on_src_func_dst_func.subtract_one_minus_src_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028658 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb"
        "uffer.equation_src_func_dst_func.subtract_dst_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028659 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb"
        "uffer.equation_src_func_dst_func.subtract_dst_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028660 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_dst_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028661 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028662 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_dst_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028663 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028664 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_dst_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028665 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028666 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff"
        "er.equation_src_func_dst_func.subtract_dst_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028667 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028668 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_dst_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028669 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_dst_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028670 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_dst_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028671 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa"
        "tion_src_func_dst_func.subtract_dst_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028672 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e"
        "quation_src_func_dst_func.subtract_dst_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028673 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_one_minus_dst_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028674 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer"
        ".equation_src_func_dst_func.subtract_one_minus_dst_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028675 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_dst_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028676 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio"
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028677 end";
}

static HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_028678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq"
        "uation_src_func_dst_func.subtract_one_minus_dst_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30029TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30029TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30029TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30029TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30029TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_028678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_028678 end";
}
