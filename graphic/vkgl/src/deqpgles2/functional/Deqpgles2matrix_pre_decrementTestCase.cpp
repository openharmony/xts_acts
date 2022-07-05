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
#include "../ActsDeqpgles20008TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix."
        "pre_decrement.dynamic_lowp_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007493 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.p"
        "re_decrement.dynamic_lowp_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007494 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pr"
        "e_decrement.dynamic_mediump_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007495 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pre"
        "_decrement.dynamic_mediump_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007496 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.p"
        "re_decrement.dynamic_highp_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007497 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pr"
        "e_decrement.dynamic_highp_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007498 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix."
        "pre_decrement.dynamic_lowp_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007499 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.p"
        "re_decrement.dynamic_lowp_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007500 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pr"
        "e_decrement.dynamic_mediump_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007501 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pre"
        "_decrement.dynamic_mediump_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007502 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.p"
        "re_decrement.dynamic_highp_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007503 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pr"
        "e_decrement.dynamic_highp_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007504 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix."
        "pre_decrement.dynamic_lowp_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007505 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.p"
        "re_decrement.dynamic_lowp_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007506 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pr"
        "e_decrement.dynamic_mediump_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007507 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pre"
        "_decrement.dynamic_mediump_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007508 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.p"
        "re_decrement.dynamic_highp_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007509 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.matrix.pr"
        "e_decrement.dynamic_highp_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007510 end";
}
