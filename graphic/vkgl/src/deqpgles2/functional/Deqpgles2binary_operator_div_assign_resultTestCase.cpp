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
#include "../ActsDeqpgles20006TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005482 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005483 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005484 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005485 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005486 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005487 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binar"
        "y_operator.div_assign_result.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005488 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005489 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005490 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005491 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005492 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005493 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binar"
        "y_operator.div_assign_result.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005494 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005495 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005496 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005497 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005498 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005499 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binar"
        "y_operator.div_assign_result.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005500 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005501 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005502 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005503 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005504 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005505 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binar"
        "y_operator.div_assign_result.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005506 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005507 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005508 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005509 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binar"
        "y_operator.div_assign_result.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005510 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005511 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005512 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005513 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005514 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005515 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005516 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005517 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005518 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005519 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005520 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005521 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005522 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005523, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005523 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005523 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005523 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005524, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005524 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005524 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005524 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005525, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005525 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005525 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005525 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005526, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005526 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005526 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005526 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005527, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005527 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005527 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005527 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005528, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005528 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary"
        "_operator.div_assign_result.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005528 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005528 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005529, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005529 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_"
        "operator.div_assign_result.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005529 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005529 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005530, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005530 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.lowp_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005530 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005530 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005531, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005531 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.lowp_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005531 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005531 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.mediump_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005532 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_oper"
        "ator.div_assign_result.mediump_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005533 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.highp_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005534 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.highp_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005535 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.lowp_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005536 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.lowp_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005537 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.mediump_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005538 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005539, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005539 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_oper"
        "ator.div_assign_result.mediump_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005539 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005539 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005540, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005540 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.highp_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005540 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005540 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005541, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005541 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.highp_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005541 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005541 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005542, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005542 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.lowp_vec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005542 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005542 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005543, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005543 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.lowp_vec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005543 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005543 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.mediump_vec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005544 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_oper"
        "ator.div_assign_result.mediump_vec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005545 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.highp_vec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005546 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.highp_vec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005547 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.lowp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005548 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.lowp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005549 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.mediump_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005550 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.mediump_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005551 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.highp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005552 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.highp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005553 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.lowp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005554 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.lowp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005555 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.mediump_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005556 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.mediump_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005557 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.highp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005558 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.highp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005559 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.lowp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005560 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.lowp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005561 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.mediump_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005562 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_ope"
        "rator.div_assign_result.mediump_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005563 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_o"
        "perator.div_assign_result.highp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005564 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.binary_op"
        "erator.div_assign_result.highp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005565 end";
}
