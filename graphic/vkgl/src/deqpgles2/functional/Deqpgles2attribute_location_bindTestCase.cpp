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

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013926, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013926 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013926 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013926 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013927, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013927 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013927 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013927 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013928 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013929 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013930, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013930 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013930 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013930 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013931, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013931 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013931 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013931 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.att"
        "ribute_location.bind.mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013932 end";
}
