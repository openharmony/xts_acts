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
#include "../ActsDeqpgles20010TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009332 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009333 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009334 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009335 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009336 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009337 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009338 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009339, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009339 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009339 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009339 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009340, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009340 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009340 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009340 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009341, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009341 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009341 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009341 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009342, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009342 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009342 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009342 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009343, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009343 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009343 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009343 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009344, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009344 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009344 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009344 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009345, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009345 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009345 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009345 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009346, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009346 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009346 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009346 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009347, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009347 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009347 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009347 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009348, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009348 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009348 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009348 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009349, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009349 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009349 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009349 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009350, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009350 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009350 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009350 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009351, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009351 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009351 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009351 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009352, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009352 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009352 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009352 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009353, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009353 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009353 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009353 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009354, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009354 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009354 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009354 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009355, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009355 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009355 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009355 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009356, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009356 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009356 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009356 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009357, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009357 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009357 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009357 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009358 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009359 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009360, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009360 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009360 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009360 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009361 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009362 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009363 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009364 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009365 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009366 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009367 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009368 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009369 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009370 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009371 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009372 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009373 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009374 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009375 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009376 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009377 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009378 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009379 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009380 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009381 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.50",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009382 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009383 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009384 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.53",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009385 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.54",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009386 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.55",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009387 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009388 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.57",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009389 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009390 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009391 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.60",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009392 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009393 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.62",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009394 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009395 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009396 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.65",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009397 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.66",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009398 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009399 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.68",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009400 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009401 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009402 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009403 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.72",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009404 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.73",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009405 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.74",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009406 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.75",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009407 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.76",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009408 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.77",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009409 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.78",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009410 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.79",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009411 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.80",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009412 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.81",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009413 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.82",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009414 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.83",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009415 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.84",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009416 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.85",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009417 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.86",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009418 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.87",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009419 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.88",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009420 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.89",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009421 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.90",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009422 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.91",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009423 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.92",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009424 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.93",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009425 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.94",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009426 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.95",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009427 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.96",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009428 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.97",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009429 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.98",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009430 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.conditionals.combined.99",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009431 end";
}
