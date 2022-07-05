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
#include "../ActsDeqpgles20001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.builtin.line_and_file_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000447 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.builtin.line_and_file_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000448 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.builtin.line_defined_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000449 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.builtin.line_defined_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000450 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prep"
        "rocessor.builtin.empty_line_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000451 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.builtin.empty_line_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000452 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.builtin.invalid_line_file_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000453 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproces"
        "sor.builtin.invalid_line_file_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000454 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.builtin.invalid_line_file_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000455 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproces"
        "sor.builtin.invalid_line_file_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000456 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.builtin.invalid_line_file_4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000457 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproces"
        "sor.builtin.invalid_line_file_4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000458 end";
}
