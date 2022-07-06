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

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binar"
        "y_operator.mod_assign_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010064 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010065 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010066 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010067 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010068 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010069 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010070 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010071 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010072 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010073 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010074 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010075 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010076 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010077 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010078 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010079 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binar"
        "y_operator.mod_assign_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010080 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010081 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010082 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010083 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010084 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010085 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010086 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010087 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binar"
        "y_operator.mod_assign_effect.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010088 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010089 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010090 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010091 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010092 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010093 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010094 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010095 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010096 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010097 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010098 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010099 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010100 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010101 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010102 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010103 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010104 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010105 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010106 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010107 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010108 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010109 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary"
        "_operator.mod_assign_effect.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010110 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_"
        "operator.mod_assign_effect.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010111 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.lowp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010112 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.lowp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010113 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.mediump_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010114 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.mediump_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010115 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.lowp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010116 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.lowp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010117 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.mediump_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010118 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.mediump_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010119 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.lowp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010120 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.lowp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010121 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.mediump_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010122 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.mediump_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010123 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.highp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010124 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.highp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010125 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.highp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010126 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.highp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010127 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.highp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010128 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.highp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010129 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.lowp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010130 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.lowp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010131 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010132, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010132 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.mediump_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010132 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010132 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010133, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010133 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.mod_assign_effect.mediump_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010133 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010133 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010134, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010134 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.lowp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010134 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010134 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.lowp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010135 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.mediump_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010136 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.mod_assign_effect.mediump_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010137 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010138, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010138 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.mod_assign_effect.lowp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010138 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010138 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010139, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010139 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.lowp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010139 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010139 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.mediump_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010140 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.mod_assign_effect.mediump_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010141 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.highp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010142 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.highp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010143 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.highp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010144 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.highp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010145 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.mod_assign_effect.highp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010146 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.mod_assign_effect.highp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010147 end";
}
