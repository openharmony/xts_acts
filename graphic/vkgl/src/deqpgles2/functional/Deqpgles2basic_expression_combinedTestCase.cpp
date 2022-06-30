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
#include "../ActsDeqpgles20009TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008532 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008533 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008534 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008535 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008536 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008537 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008538 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008539, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008539 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008539 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008539 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008540, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008540 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008540 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008540 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008541, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008541 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008541 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008541 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008542, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008542 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008542 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008542 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008543, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008543 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008543 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008543 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008544 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008545 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008546 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008547 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008548 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008549 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008550 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008551 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008552 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008553 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008554 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008555 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008556 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008557 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008558 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008559 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008560 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008561 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008562 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008563 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008564 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008565 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008566, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008566 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008566 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008566 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008567 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008568 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008569 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008570 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008571 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008572 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008573 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008574 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008575 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008576, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008576 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008576 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008576 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008577, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008577 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008577 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008577 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008578, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008578 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008578 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008578 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008579, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008579 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008579 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008579 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008580, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008580 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008580 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008580 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008581, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008581 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008581 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008581 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008582, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008582 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.50",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008582 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008582 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008583, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008583 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008583 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008583 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008584, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008584 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008584 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008584 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008585, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008585 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.53",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008585 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008585 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008586, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008586 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.54",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008586 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008586 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008587, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008587 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.55",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008587 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008587 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008588, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008588 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008588 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008588 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008589, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008589 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.57",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008589 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008589 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008590 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008591, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008591 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008591 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008591 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008592, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008592 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.60",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008592 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008592 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008593, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008593 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008593 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008593 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008594, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008594 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.62",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008594 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008594 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008595, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008595 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008595 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008595 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008596, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008596 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008596 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008596 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008597, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008597 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.65",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008597 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008597 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008598, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008598 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.66",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008598 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008598 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008599, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008599 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008599 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008599 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008600, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008600 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.68",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008600 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008600 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008601, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008601 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008601 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008601 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008602, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008602 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008602 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008602 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008603, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008603 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008603 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008603 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008604, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008604 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.72",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008604 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008604 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008605, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008605 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.73",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008605 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008605 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008606, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008606 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.74",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008606 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008606 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008607, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008607 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.75",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008607 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008607 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008608, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008608 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.76",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008608 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008608 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008609, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008609 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.77",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008609 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008609 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008610, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008610 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.78",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008610 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008610 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008611, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008611 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.79",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008611 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008611 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008612, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008612 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.80",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008612 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008612 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.81",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008613 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.82",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008614 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.83",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008615 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.84",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008616 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008617, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008617 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.85",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008617 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008617 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008618, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008618 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.86",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008618 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008618 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008619, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008619 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.87",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008619 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008619 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008620, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008620 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.88",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008620 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008620 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008621, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008621 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.89",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008621 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008621 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008622, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008622 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.90",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008622 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008622 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.91",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008623 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.92",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008624 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.93",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008625 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.94",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008626 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.95",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008627 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.96",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008628 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.97",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008629 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.98",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008630 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ra"
        "ndom.basic_expression.combined.99",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008631 end";
}
