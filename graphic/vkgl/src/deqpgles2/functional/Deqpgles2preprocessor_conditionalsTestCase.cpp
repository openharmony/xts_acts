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

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preprocessor.c"
        "onditionals.unterminated_nested_blocks_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000399 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preprocessor.co"
        "nditionals.unterminated_nested_blocks_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000400 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.conditionals.ifdef_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000401 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.conditionals.ifdef_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000402 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.conditionals.ifdef_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000403 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.conditionals.ifdef_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000404 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.conditionals.ifdef_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000405 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.conditionals.ifdef_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000406 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.conditionals.invalid_ifdef_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000407 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproces"
        "sor.conditionals.invalid_ifdef_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000408 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.conditionals.ifndef_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000409 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.conditionals.ifndef_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000410 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepr"
        "ocessor.conditionals.ifndef_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000411 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.prepro"
        "cessor.conditionals.ifndef_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000412 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.conditionals.invalid_ifndef_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000413 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproces"
        "sor.conditionals.invalid_ifndef_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000414 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preprocessor.co"
        "nditionals.mixed_conditional_inclusion_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000415 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preprocessor.con"
        "ditionals.mixed_conditional_inclusion_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000416 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.conditionals.nested_if_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000417 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.conditionals.nested_if_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000418 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.conditionals.nested_if_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000419 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.conditionals.nested_if_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000420 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproc"
        "essor.conditionals.nested_if_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000421 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.preproce"
        "ssor.conditionals.nested_if_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000422 end";
}
