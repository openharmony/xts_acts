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
#include "../ActsDeqpgles20012TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.contained_tris",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011135 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.scissor.partial_tris",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011136 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.contained_tri",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011137 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011138, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011138 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.enclosing_tri",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011138 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011138 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011139, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011139 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.scissor.partial_tri",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011139 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011139 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.scissor.outside_render_tri",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011140 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.partial_lines",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011141 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.contained_line",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011142 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.scissor.partial_line",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011143 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_"
        "ops.scissor.outside_render_line",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011144 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragmen"
        "t_ops.scissor.contained_point",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011145 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.partial_points",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011146 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.outside_point",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011147 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment_"
        "ops.scissor.outside_render_point",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011148 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.scissor.clear_depth",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011149 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.scissor.clear_stencil",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011150 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.scissor.clear_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011151 end";
}
