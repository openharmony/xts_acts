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
#include "../ActsDeqpgles20002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.missing_parenthesis_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001322 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditional"
        "s.invalid_if.missing_parenthesis_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001323 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.unclosed_parenthesis_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001324 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditional"
        "s.invalid_if.unclosed_parenthesis_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001325 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditi"
        "onals.invalid_if.int_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001326 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditio"
        "nals.invalid_if.int_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001327 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.condition"
        "als.invalid_if.int_zero_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001328 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.int_zero_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001329 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.condition"
        "als.invalid_if.int_one_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001330 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.int_one_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001331 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditional"
        "s.invalid_if.int_uniform_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001332 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditionals"
        ".invalid_if.int_uniform_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001333 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditio"
        "nals.invalid_if.float_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001334 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.condition"
        "als.invalid_if.float_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001335 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.float_zero_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001336 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditional"
        "s.invalid_if.float_zero_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001337 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.float_one_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001338 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001339, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001339 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditional"
        "s.invalid_if.float_one_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001339 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001339 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001340, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001340 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.condition"
        "als.invalid_if.sampler_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001340 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001340 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001341, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001341 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conditiona"
        "ls.invalid_if.sampler_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001341 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001341 end";
}
