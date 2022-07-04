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
#include "../ActsDeqpgles20005TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004078 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004079 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004080 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004081 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004082 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004083 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_decrement_effect.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004084 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004085 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004086 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004087 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004088 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004089 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_decrement_effect.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004090 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004091 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004092 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004093 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004094 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004095 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_decrement_effect.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004096 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004097 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004098 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004099 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004100 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004101 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_decrement_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004102 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004103 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004104 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004105 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.pre_decrement_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004106 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004107 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004108 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004109 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004110 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004111 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004112 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004113 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004114 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004115 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004116 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004117 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004118 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004119 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004120 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004121 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004122 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.pre_decrement_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004123 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.pre_decrement_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004124 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.pre_decrement_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004125 end";
}
