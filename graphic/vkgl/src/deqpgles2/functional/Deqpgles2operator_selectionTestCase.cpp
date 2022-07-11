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
#include "../ActsDeqpgles20007TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006774 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006775 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006776 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006777 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006778 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006779 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.op"
        "erator.selection.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006780 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006781 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006782 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006783 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006784 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006785 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.op"
        "erator.selection.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006786 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006787 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006788 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006789 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006790 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006791 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.op"
        "erator.selection.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006792 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006793 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006794 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006795 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006796 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006797 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.op"
        "erator.selection.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006798 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006799 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006800 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006801 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.op"
        "erator.selection.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006802 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006803 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006804 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006805 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006806, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006806 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006806 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006806 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006807, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006807 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006807 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006807 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006808, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006808 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006808 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006808 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006809, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006809 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006809 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006809 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006810, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006810 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006810 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006810 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006811, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006811 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006811 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006811 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006812, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006812 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006812 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006812 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006813, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006813 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006813 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006813 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006814, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006814 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006814 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006814 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006815, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006815 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006815 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006815 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006816, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006816 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006816 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006816 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006817, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006817 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006817 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006817 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006818, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006818 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006818 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006818 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006819, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006819 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.opera"
        "tor.selection.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006819 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006819 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006820, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006820 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.ope"
        "rator.selection.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006820 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006820 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006821, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006821 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.oper"
        "ator.selection.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006821 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006821 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006822, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006822 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "operator.selection.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006822 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006822 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006823, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006823 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.o"
        "perator.selection.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006823 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006823 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006824, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006824 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "operator.selection.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006824 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006824 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006825, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006825 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.o"
        "perator.selection.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006825 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006825 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006826, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006826 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "operator.selection.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006826 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006826 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006827, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006827 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.o"
        "perator.selection.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006827 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006827 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006828, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006828 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "operator.selection.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006828 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006828 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006829, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006829 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.o"
        "perator.selection.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006829 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006829 end";
}
