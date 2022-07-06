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

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_and_assign_result.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011324 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011325 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011326 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011327 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011328 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011329 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011330 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011331 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011332 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011333 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011334 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011335 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011336 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011337 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011338 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011339, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011339 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011339 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011339 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011340, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011340 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_and_assign_result.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011340 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011340 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011341, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011341 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011341 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011341 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011342, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011342 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011342 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011342 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011343, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011343 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011343 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011343 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011344, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011344 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011344 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011344 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011345, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011345 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011345 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011345 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011346, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011346 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011346 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011346 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011347, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011347 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011347 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011347 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011348, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011348 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_and_assign_result.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011348 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011348 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011349, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011349 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011349 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011349 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011350, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011350 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011350 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011350 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011351, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011351 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011351 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011351 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011352, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011352 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011352 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011352 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011353, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011353 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011353 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011353 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011354, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011354 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011354 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011354 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011355, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011355 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011355 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011355 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011356, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011356 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011356 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011356 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011357, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011357 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011357 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011357 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011358 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011359 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011360, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011360 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011360 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011360 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011361 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011362 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011363 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011364 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011365 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011366 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011367 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011368 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011369 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_and_assign_result.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011370 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_and_assign_result.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011371 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.lowp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011372 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.lowp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011373 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.mediump_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011374 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.mediump_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011375 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.lowp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011376 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.lowp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011377 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.mediump_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011378 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.mediump_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011379 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.lowp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011380 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.lowp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011381 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.mediump_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011382 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.mediump_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011383 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.highp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011384 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.highp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011385 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.highp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011386 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.highp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011387 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.highp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011388 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.highp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011389 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.lowp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011390 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.lowp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011391 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.mediump_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011392 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_and_assign_result.mediump_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011393 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.lowp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011394 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.lowp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011395 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.mediump_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011396 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_and_assign_result.mediump_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011397 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_and_assign_result.lowp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011398 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.lowp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011399 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.mediump_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011400 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operator"
        ".bitwise_and_assign_result.mediump_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011401 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.highp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011402 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.highp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011403 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.highp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011404 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.highp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011405 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_and_assign_result.highp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011406 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_and_assign_result.highp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011407 end";
}
