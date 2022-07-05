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

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dith"
        "er.disabled.gradient_white",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015285 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dit"
        "her.disabled.gradient_red",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015286 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dith"
        "er.disabled.gradient_green",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015287 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dit"
        "her.disabled.gradient_blue",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015288 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dith"
        "er.disabled.gradient_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015289 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dither."
        "disabled.unicolored_quad_white",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015290 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dither"
        ".disabled.unicolored_quad_red",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015291 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dither."
        "disabled.unicolored_quad_green",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015292 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dither."
        "disabled.unicolored_quad_blue",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015293 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.dither."
        "disabled.unicolored_quad_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015294 end";
}
