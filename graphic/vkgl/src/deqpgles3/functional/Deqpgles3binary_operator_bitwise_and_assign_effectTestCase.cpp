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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30011TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_and_assign_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010148 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010149 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010150 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010151 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010152, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010152 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010152 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010152 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010153, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010153 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010153 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010153 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010154, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010154 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010154 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010154 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010155, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010155 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010155 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010155 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010156, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010156 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010156 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010156 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010157, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010157 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010157 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010157 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010158, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010158 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010158 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010158 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010159, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010159 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010159 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010159 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010160, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010160 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010160 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010160 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010161, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010161 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010161 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010161 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010162, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010162 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010162 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010162 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010163, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010163 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010163 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010163 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010164, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010164 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_and_assign_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010164 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010164 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010165, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010165 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010165 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010165 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010166, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010166 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010166 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010166 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010167, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010167 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010167 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010167 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010168, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010168 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010168 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010168 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010169, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010169 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010169 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010169 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010170, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010170 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010170 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010170 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010171, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010171 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010171 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010171 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010172, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010172 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_and_assign_effect.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010172 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010172 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010173, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010173 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010173 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010173 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010174, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010174 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010174 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010174 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010175, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010175 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010175 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010175 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010176, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010176 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010176 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010176 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010177, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010177 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010177 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010177 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010178, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010178 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010178 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010178 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010179, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010179 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010179 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010179 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010180, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010180 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010180 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010180 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010181, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010181 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010181 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010181 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010182, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010182 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010182 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010182 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010183, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010183 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010183 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010183 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010184, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010184 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010184 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010184 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010185, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010185 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010185 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010185 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010186, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010186 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010186 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010186 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010187, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010187 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010187 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010187 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010188, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010188 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010188 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010188 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010189, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010189 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010189 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010189 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010190, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010190 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010190 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010190 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010191, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010191 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010191 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010191 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010192, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010192 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010192 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010192 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010193, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010193 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010193 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010193 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010194, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010194 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_effect.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010194 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010194 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010195, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010195 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_effect.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010195 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010195 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010196, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010196 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.lowp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010196 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010196 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010197, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010197 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.lowp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010197 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010197 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010198, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010198 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.mediump_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010198 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010198 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010199, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010199 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.mediump_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010199 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010199 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010200, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010200 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.lowp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010200 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010200 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010201, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010201 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.lowp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010201 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010201 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010202, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010202 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.mediump_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010202 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010202 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010203, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010203 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.mediump_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010203 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010203 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010204, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010204 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.lowp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010204 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010204 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010205, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010205 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.lowp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010205 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010205 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010206, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010206 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.mediump_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010206 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010206 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010207, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010207 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.mediump_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010207 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010207 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010208, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010208 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.highp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010208 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010208 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010209, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010209 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.highp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010209 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010209 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010210, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010210 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.highp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010210 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010210 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.highp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010211 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.highp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010212 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010213, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010213 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.highp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010213 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010213 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010214, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010214 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.lowp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010214 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010214 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010215, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010215 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.lowp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010215 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010215 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010216, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010216 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.mediump_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010216 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010216 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010217, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010217 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_and_assign_effect.mediump_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010217 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010217 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010218, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010218 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.lowp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010218 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010218 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010219, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010219 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.lowp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010219 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010219 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010220, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010220 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.mediump_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010220 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010220 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010221, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010221 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_and_assign_effect.mediump_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010221 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010221 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010222, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010222 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_effect.lowp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010222 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010222 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010223, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010223 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.lowp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010223 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010223 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.mediump_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010224 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_and_assign_effect.mediump_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010225 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.highp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010226 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.highp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010227 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.highp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010228 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.highp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010229 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_effect.highp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010230 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_effect.highp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010231 end";
}
