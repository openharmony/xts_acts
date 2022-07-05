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

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressio"
        "ns.builtin_functions.matrix.compMult_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008224 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expression"
        "s.builtin_functions.matrix.compMult_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008225 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressio"
        "ns.builtin_functions.matrix.compMult_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008226 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expression"
        "s.builtin_functions.matrix.compMult_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008227 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressio"
        "ns.builtin_functions.matrix.compMult_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008228 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expression"
        "s.builtin_functions.matrix.compMult_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008229 end";
}
