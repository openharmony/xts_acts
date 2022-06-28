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

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009532 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009533 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009534 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009535 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009536 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009537 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009538 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009539, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009539 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009539 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009539 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009540, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009540 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009540 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009540 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009541, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009541 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "random.trigonometric.fragment.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009541 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009541 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009542, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009542 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009542 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009542 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009543, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009543 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009543 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009543 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009544 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009545 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009546 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009547 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009548 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009549 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009550 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009551 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009552 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009553 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009554 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009555 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009556 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009557 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009558 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009559 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009560 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009561 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009562 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009563 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009564 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009565 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009566, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009566 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009566 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009566 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009567 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009568 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009569 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009570 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009571 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009572 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009573 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009574 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009575 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009576, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009576 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009576 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009576 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009577, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009577 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009577 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009577 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009578, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009578 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009578 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009578 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009579, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009579 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009579 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009579 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009580, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009580 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009580 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009580 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009581, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009581 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009581 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009581 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009582, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009582 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.50",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009582 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009582 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009583, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009583 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009583 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009583 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009584, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009584 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009584 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009584 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009585, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009585 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.53",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009585 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009585 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009586, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009586 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.54",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009586 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009586 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009587, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009587 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.55",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009587 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009587 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009588, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009588 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009588 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009588 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009589, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009589 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.57",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009589 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009589 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009590 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009591, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009591 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009591 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009591 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009592, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009592 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.60",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009592 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009592 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009593, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009593 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009593 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009593 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009594, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009594 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.62",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009594 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009594 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009595, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009595 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009595 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009595 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009596, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009596 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009596 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009596 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009597, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009597 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.65",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009597 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009597 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009598, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009598 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.66",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009598 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009598 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009599, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009599 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009599 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009599 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009600, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009600 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.68",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009600 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009600 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009601, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009601 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009601 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009601 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009602, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009602 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009602 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009602 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009603, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009603 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009603 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009603 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009604, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009604 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.72",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009604 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009604 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009605, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009605 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.73",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009605 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009605 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009606, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009606 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.74",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009606 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009606 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009607, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009607 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.75",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009607 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009607 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009608, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009608 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.76",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009608 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009608 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009609, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009609 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.77",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009609 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009609 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009610, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009610 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.78",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009610 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009610 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009611, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009611 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.79",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009611 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009611 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009612, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009612 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.80",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009612 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009612 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.81",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009613 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.82",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009614 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.83",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009615 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.84",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009616 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009617, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009617 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.85",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009617 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009617 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009618, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009618 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.86",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009618 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009618 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009619, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009619 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.87",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009619 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009619 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009620, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009620 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.88",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009620 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009620 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009621, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009621 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.89",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009621 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009621 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009622, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009622 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.90",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009622 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009622 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.91",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009623 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.92",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009624 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.93",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009625 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.94",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009626 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.95",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009627 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.96",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009628 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.97",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009629 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.98",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009630 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.trigonometric.fragment.99",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009631 end";
}
