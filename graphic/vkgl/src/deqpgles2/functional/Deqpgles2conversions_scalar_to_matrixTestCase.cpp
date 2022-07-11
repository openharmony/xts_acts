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

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.float_to_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001065 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.scalar_to_matrix.float_to_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001066 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.float_to_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001067 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.scalar_to_matrix.float_to_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001068 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.float_to_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001069 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.scalar_to_matrix.float_to_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001070 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversi"
        "ons.scalar_to_matrix.int_to_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001071 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.int_to_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001072 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversi"
        "ons.scalar_to_matrix.int_to_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001073 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.int_to_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001074 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversi"
        "ons.scalar_to_matrix.int_to_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001075 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.int_to_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001076 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.bool_to_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001077 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.scalar_to_matrix.bool_to_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001078 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.bool_to_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001079 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.scalar_to_matrix.bool_to_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001080 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversio"
        "ns.scalar_to_matrix.bool_to_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001081 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.scalar_to_matrix.bool_to_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001082 end";
}
