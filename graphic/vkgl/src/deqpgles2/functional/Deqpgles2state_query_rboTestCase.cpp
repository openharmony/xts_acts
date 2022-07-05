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

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.state"
        "_query.rbo.renderbuffer_size",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015658 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.state_query"
        ".rbo.renderbuffer_internal_format",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015659 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.state_query.r"
        "bo.renderbuffer_component_size_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015660 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.state_query.r"
        "bo.renderbuffer_component_size_depth",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015661 end";
}
