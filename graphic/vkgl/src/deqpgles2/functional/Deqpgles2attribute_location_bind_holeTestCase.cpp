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
#include "../ActsDeqpgles20014TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attrib"
        "ute_location.bind_hole.float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013957 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attri"
        "bute_location.bind_hole.vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013958 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attri"
        "bute_location.bind_hole.vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013959 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attri"
        "bute_location.bind_hole.vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013960 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attri"
        "bute_location.bind_hole.mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013961 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attri"
        "bute_location.bind_hole.mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013962 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.attri"
        "bute_location.bind_hole.mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013963 end";
}
