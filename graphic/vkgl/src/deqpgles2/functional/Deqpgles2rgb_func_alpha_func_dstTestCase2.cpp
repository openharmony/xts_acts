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
#include "../ActsDeqpgles20013TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012153, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012153 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.dst.constant_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012153 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012153 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012154, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012154 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.constant_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012154 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012154 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012155, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012155 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.dst.constant_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012155 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012155 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012156, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012156 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.constant_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012156 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012156 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012157, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012157 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.dst.constant_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012157 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012157 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012158, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012158 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.constant_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012158 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012158 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012159, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012159 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.dst.constant_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012159 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012159 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012160, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012160 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.constant_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012160 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012160 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012161, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012161 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.dst.one_minus_constant_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012161 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012161 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012162, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012162 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.dst.one_minus_constant_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012162 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012162 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012163, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012163 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012163 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012163 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012164, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012164 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012164 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012164 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012165, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012165 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012165 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012165 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012166, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012166 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012166 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012166 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012167, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012167 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012167 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012167 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012168, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012168 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012168 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012168 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012169, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012169 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012169 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012169 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012170, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012170 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012170 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012170 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012171, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012171 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.one_minus_constant_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012171 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012171 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012172, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012172 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.dst.one_minus_constant_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012172 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012172 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012173, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012173 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.one_minus_constant_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012173 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012173 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012174, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012174 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.dst.one_minus_constant_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012174 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012174 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012175, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012175 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.r"
        "gb_func_alpha_func.dst.constant_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012175 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012175 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012176, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012176 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend."
        "rgb_func_alpha_func.dst.constant_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012176 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012176 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012177, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012177 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.dst.constant_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012177 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012177 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012178, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012178 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.constant_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012178 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012178 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012179, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012179 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.dst.constant_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012179 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012179 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012180, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012180 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.constant_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012180 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012180 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012181, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012181 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.dst.constant_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012181 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012181 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012182, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012182 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.constant_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012182 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012182 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012183, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012183 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.dst.constant_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012183 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012183 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012184, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012184 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.constant_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012184 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012184 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012185, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012185 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.dst.constant_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012185 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012185 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012186, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012186 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.constant_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012186 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012186 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012187, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012187 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.dst.constant_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012187 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012187 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012188, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012188 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.constant_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012188 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012188 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012189, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012189 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.dst.one_minus_constant_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012189 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012189 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012190, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012190 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.dst.one_minus_constant_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012190 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012190 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012191, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012191 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012191 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012191 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012192, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012192 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012192 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012192 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012193, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012193 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012193 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012193 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012194, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012194 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012194 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012194 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012195, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012195 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012195 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012195 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012196, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012196 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012196 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012196 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012197, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012197 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.dst.one_minus_constant_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012197 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012197 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012198, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012198 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.dst.one_minus_constant_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012198 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012198 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012199, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012199 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.one_minus_constant_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012199 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012199 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012200, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012200 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.dst.one_minus_constant_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012200 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012200 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012201, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012201 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.dst.one_minus_constant_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012201 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012201 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012202, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012202 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.dst.one_minus_constant_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012202 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012202 end";
}
