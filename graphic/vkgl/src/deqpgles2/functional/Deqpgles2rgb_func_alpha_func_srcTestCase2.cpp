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

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_dst_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011928 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_dst_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011929 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011930, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011930 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_dst_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011930 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011930 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011931, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011931 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a"
        "lpha_func.src.one_minus_dst_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011931 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011931 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.r"
        "gb_func_alpha_func.src.constant_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011932 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011933, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011933 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend."
        "rgb_func_alpha_func.src.constant_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011933 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011933 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011934, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011934 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011934 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011934 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011935, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011935 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011935 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011935 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011936, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011936 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011936 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011936 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011937, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011937 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011937 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011937 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011938, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011938 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011938 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011938 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011939, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011939 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011939 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011939 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011940, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011940 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011940 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011940 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011941, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011941 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011941 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011941 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011942, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011942 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.src.constant_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011942 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011942 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011943, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011943 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.constant_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011943 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011943 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011944, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011944 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.src.constant_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011944 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011944 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011945, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011945 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.constant_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011945 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011945 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011946, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011946 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011946 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011946 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011947, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011947 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.src.one_minus_constant_color_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011947 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011947 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011948, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011948 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.src.one_minus_constant_color_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011948 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011948 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011949, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011949 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_color_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011949 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011949 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011950, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011950 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_color_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011950 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011950 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011951, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011951 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_color_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011951 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011951 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011952, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011952 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_color_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011952 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011952 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011953, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011953 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_color_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011953 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011953 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011954, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011954 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_color_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011954 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011954 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011955, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011955 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_color_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011955 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011955 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011956, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011956 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_color_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011956 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011956 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.one_minus_constant_color_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011957 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.src.one_minus_constant_color_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011958 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.one_minus_constant_color_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011959 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.src.one_minus_constant_color_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011960 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_color_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011961 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.r"
        "gb_func_alpha_func.src.constant_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011962 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend."
        "rgb_func_alpha_func.src.constant_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011963 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011964 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011965 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011966 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011967 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011968 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011969 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.constant_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011970 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011971 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.src.constant_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011972 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.constant_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011973 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.src.constant_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011974 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.constant_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011975 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.constant_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011976 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_fu"
        "nc_alpha_func.src.one_minus_constant_alpha_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011977 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.src.one_minus_constant_alpha_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011978 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_alpha_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011979 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_alpha_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011980 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_alpha_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011981 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_alpha_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011982 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_alpha_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011983 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_alpha_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011984 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func"
        "_alpha_func.src.one_minus_constant_alpha_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011985 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_alpha_one_minus_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011986 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.one_minus_constant_alpha_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011987 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.src.one_minus_constant_alpha_one_minus_constant_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011988 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_al"
        "pha_func.src.one_minus_constant_alpha_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011989 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alpha_f"
        "unc.src.one_minus_constant_alpha_one_minus_constant_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011990 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_alph"
        "a_func.src.one_minus_constant_alpha_src_alpha_saturate",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011991 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb"
        "_func_alpha_func.src.src_alpha_saturate_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011992 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rg"
        "b_func_alpha_func.src.src_alpha_saturate_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011993 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.src.src_alpha_saturate_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011994 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a"
        "lpha_func.src.src_alpha_saturate_one_minus_src_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011995 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.src.src_alpha_saturate_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011996 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a"
        "lpha_func.src.src_alpha_saturate_one_minus_dst_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011997 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.src.src_alpha_saturate_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011998 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_func_a"
        "lpha_func.src.src_alpha_saturate_one_minus_src_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011999 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_012000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_ops.blend.rgb_f"
        "unc_alpha_func.src.src_alpha_saturate_dst_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012000 end";
}
