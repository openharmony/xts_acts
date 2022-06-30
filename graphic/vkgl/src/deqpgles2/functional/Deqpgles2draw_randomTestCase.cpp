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
#include "../ActsDeqpgles20017TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016361 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016362 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016363 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016364 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016365 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016366 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functi"
        "onal.draw.random.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016367 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016368 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016369 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016370 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016371 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016372 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016373 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016374 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016375 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016376 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016377 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016378 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016379 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016380 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016381 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016382 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016383 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016384 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016385 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016386 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016387 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016388 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016389 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016390 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016391 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016392 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016393 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016394 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016395 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016396 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016397 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.50",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016398 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016399 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016400 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016401 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016402 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016403 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016404 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.62",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016405 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016406 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.65",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016407 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016408 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016409 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016410 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functio"
        "nal.draw.random.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016411 end";
}
