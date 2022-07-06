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
#include "../ActsDeqpgles30012TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_xor_assign_result.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011492 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011493 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011494 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011495 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011496 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011497 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011498 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011499 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011500 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011501 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011502 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011503 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011504 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011505 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011506 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011507 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_xor_assign_result.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011508 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011509 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011510 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011511 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011512 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011513 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011514 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011515 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_xor_assign_result.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011516 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011517 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011518 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011519 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011520 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011521 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011522 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011523, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011523 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011523 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011523 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011524, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011524 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011524 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011524 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011525, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011525 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011525 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011525 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011526, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011526 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011526 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011526 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011527, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011527 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011527 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011527 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011528, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011528 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011528 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011528 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011529, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011529 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011529 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011529 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011530, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011530 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011530 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011530 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011531, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011531 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011531 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011531 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011532 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011533 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011534 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011535 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011536 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011537 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_xor_assign_result.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011538 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011539, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011539 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_xor_assign_result.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011539 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011539 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011540, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011540 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.lowp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011540 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011540 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011541, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011541 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.lowp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011541 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011541 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011542, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011542 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.mediump_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011542 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011542 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011543, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011543 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.mediump_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011543 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011543 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.lowp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011544 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.lowp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011545 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.mediump_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011546 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.mediump_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011547 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.lowp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011548 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.lowp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011549 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.mediump_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011550 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.mediump_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011551 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.highp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011552 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.highp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011553 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.highp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011554 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.highp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011555 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.highp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011556 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.highp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011557 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.lowp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011558 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.lowp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011559 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.mediump_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011560 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_xor_assign_result.mediump_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011561 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.lowp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011562 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.lowp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011563 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.mediump_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011564 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_xor_assign_result.mediump_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011565 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011566, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011566 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_xor_assign_result.lowp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011566 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011566 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.lowp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011567 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.mediump_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011568 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_xor_assign_result.mediump_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011569 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.highp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011570 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.highp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011571 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.highp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011572 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.highp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011573 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_xor_assign_result.highp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011574 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_xor_assign_result.highp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011575 end";
}
