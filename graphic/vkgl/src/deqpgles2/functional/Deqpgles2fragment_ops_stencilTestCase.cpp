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

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fr"
        "agment_ops.stencil.clear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011009 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_"
        "ops.stencil.stencil_fail_replace",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011010 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.stencil.depth_fail_replace",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011011 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.stencil.depth_pass_replace",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011012 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.stencil.incr_stencil_fail",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011013 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.stencil.decr_stencil_fail",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011014 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_o"
        "ps.stencil.incr_wrap_stencil_fail",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011015 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_o"
        "ps.stencil.decr_wrap_stencil_fail",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011016 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.stencil.zero_stencil_fail",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011017 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_"
        "ops.stencil.invert_stencil_fail",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011018 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.frag"
        "ment_ops.stencil.cmp_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011019 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.stencil.cmp_not_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011020 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.stencil.cmp_less_than",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011021 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.stencil.cmp_less_or_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011022 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragmen"
        "t_ops.stencil.cmp_greater_than",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011023 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_"
        "ops.stencil.cmp_greater_or_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011024 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.stencil.cmp_mask_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011025 end";
}
