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
#include "../ActsDeqpgles20006TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.greater.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005590 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005591, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005591 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.greater.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005591 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005591 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005592, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005592 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.greater.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005592 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005592 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005593, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005593 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.greater.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005593 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005593 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005594, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005594 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.greater.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005594 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005594 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005595, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005595 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.greater.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005595 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005595 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005596, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005596 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "binary_operator.greater.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005596 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005596 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005597, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005597 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.greater.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005597 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005597 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005598, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005598 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.greater.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005598 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005598 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005599, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005599 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.greater.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005599 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005599 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005600, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005600 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "binary_operator.greater.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005600 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005600 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005601, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005601 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.greater.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005601 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005601 end";
}
