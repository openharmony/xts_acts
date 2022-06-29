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

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009632 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009633 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009634 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009635 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009636 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009637 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009638 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009639 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009640 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.exponential.vertex.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009641 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009642 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009643 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009644 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009645 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009646 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009647 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009648 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009649 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009650 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009651 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009652 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009653 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009654 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009655 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009656 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009657 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009658 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009659 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009660 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009661 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009662 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009663 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009664 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009665 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009666 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009667 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009668 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009669 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009670 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009671 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009672 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009673 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009674 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009675 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009676 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009677 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009678 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009679 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009680 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009681 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.50",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009682 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.51",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009683 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.52",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009684 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.53",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009685 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.54",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009686 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.55",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009687 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.56",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009688 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.57",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009689 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.58",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009690 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.59",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009691 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.60",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009692 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.61",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009693 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.62",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009694 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.63",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009695 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009696 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.65",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009697 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.66",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009698 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.67",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009699 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.68",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009700 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.69",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009701 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.70",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009702 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.71",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009703 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.72",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009704 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.73",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009705 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.74",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009706 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.75",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009707 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.76",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009708 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.77",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009709 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.78",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009710 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.79",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009711 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.80",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009712 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.81",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009713 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.82",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009714 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.83",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009715 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.84",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009716 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.85",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009717 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.86",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009718 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.87",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009719 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.88",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009720 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.89",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009721 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.90",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009722 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.91",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009723 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.92",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009724 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.93",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009725 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.94",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009726 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.95",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009727 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.96",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009728 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.97",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009729 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.98",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009730 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".random.exponential.vertex.99",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009731 end";
}
