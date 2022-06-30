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

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004174, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004174 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004174 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004174 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004175, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004175 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004175 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004175 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004176, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004176 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004176 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004176 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004177, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004177 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004177 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004177 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004178, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004178 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004178 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004178 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004179, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004179 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004179 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004179 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004180, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004180 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004180 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004180 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004181, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004181 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004181 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004181 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004182, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004182 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004182 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004182 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004183, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004183 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004183 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004183 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004184, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004184 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004184 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004184 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004185, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004185 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004185 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004185 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004186, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004186 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004186 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004186 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004187, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004187 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004187 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004187 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004188, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004188 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004188 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004188 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004189, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004189 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004189 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004189 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004190, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004190 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004190 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004190 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004191, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004191 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004191 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004191 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004192, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004192 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004192 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004192 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004193, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004193 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004193 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004193 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004194, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004194 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004194 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004194 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004195, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004195 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004195 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004195 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004196, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004196 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004196 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004196 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004197, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004197 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004197 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004197 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004198, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004198 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_"
        "operator.post_decrement_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004198 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004198 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004199, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004199 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004199 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004199 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004200, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004200 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004200 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004200 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004201, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004201 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004201 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004201 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004202, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004202 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004202 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004202 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004203, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004203 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004203 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004203 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004204, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004204 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004204 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004204 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004205, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004205 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004205 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004205 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004206, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004206 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004206 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004206 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004207, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004207 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004207 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004207 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004208, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004208 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004208 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004208 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004209, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004209 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004209 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004209 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004210, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004210 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004210 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004210 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004211 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004212 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004213, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004213 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004213 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004213 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004214, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004214 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004214 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004214 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004215, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004215 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004215 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004215 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004216, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004216 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_o"
        "perator.post_decrement_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004216 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004216 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004217, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004217 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004217 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004217 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004218, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004218 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004218 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004218 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004219, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004219 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_oper"
        "ator.post_decrement_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004219 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004219 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004220, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004220 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_op"
        "erator.post_decrement_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004220 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004220 end";
}

static HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004221, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004221 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.unary_ope"
        "rator.post_decrement_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004221 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004221 end";
}
