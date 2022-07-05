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
#include "../ActsDeqpgles20015TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ini"
        "tial.get_uniform.multiple_basic_array.vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014303 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.init"
        "ial.get_uniform.multiple_basic_array.fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014304 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.in"
        "itial.get_uniform.multiple_basic_array.both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014305 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_pointer.get_uniform.multiple_basic_array.vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014623 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_pointer.get_uniform.multiple_basic_array.fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014624 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_pointer.get_uniform.multiple_basic_array.both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014625 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014927, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014927 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.get_uniform.multiple_basic_array.vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014927 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014927 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.get_uniform.multiple_basic_array.fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014928 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.get_uniform.multiple_basic_array.both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014929 end";
}
