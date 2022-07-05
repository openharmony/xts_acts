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
#include "../ActsDeqpgles20003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functio"
        "ns.declarations.void_vs_no_void_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002089 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.function"
        "s.declarations.void_vs_no_void_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002090 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.funct"
        "ions.declarations.in_vs_no_in_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002091 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functi"
        "ons.declarations.in_vs_no_in_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002092 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functions.decl"
        "arations.default_vs_explicit_precision_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002093 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functions.decla"
        "rations.default_vs_explicit_precision_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002094 end";
}
