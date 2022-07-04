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

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000133, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000133 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.basic.correct_phases_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000133 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000133 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000134, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000134 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.basic.correct_phases_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000134 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000134 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.basic.invalid_identifier_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000135 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.basic.invalid_identifier_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000136 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.basic.null_directive_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000137 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000138, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000138 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.basic.null_directive_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000138 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000138 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000139, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000139 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.basic.invalid_directive_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000139 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000139 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.basic.invalid_directive_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000140 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.basic.missing_identifier_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000141 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.basic.missing_identifier_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000142 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prep"
        "rocessor.basic.empty_object_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000143 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.basic.empty_object_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000144 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.basic.empty_function_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000145 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.basic.empty_function_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000146 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.basic.empty_directive_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000147 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.basic.empty_directive_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000148 end";
}
