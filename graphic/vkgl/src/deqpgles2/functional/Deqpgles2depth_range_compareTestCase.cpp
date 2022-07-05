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
#include "../ActsDeqpgles20016TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.de"
        "pth_range.compare.default",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015271 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.de"
        "pth_range.compare.reverse",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015272 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.depth"
        "_range.compare.zero_to_half",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015273 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dept"
        "h_range.compare.half_to_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015274 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.depth"
        "_range.compare.half_to_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015275 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dept"
        "h_range.compare.one_to_half",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015276 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.depth"
        "_range.compare.third_to_0_8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015277 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.depth"
        "_range.compare.0_8_to_third",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015278 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.depth"
        "_range.compare.zero_to_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015279 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.depth"
        "_range.compare.half_to_half",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015280 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dept"
        "h_range.compare.one_to_one",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015281 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dept"
        "h_range.compare.clamp_near",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015282 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dep"
        "th_range.compare.clamp_far",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015283 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dept"
        "h_range.compare.clamp_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015284 end";
}
