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
#include "../ActsDeqpgles20006TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005670 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005671 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005672 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005673 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005674 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005675 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.not_equal.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005676 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005677 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005678 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005679 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005680 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005681 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.not_equal.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005682 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005683 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005684 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005685 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005686 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005687 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.not_equal.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005688 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005689 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005690 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005691 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005692 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005693 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.not_equal.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005694 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005695 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005696 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005697 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.b"
        "inary_operator.not_equal.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005698 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005699 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005700 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005701 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005702 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005703 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005704 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005705 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005706 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005707 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005708 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005709 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005710 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005711 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005712 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005713 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005714 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bina"
        "ry_operator.not_equal.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005715 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bi"
        "nary_operator.not_equal.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005716 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.bin"
        "ary_operator.not_equal.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005717 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".binary_operator.not_equal.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005718 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "binary_operator.not_equal.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005719 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".binary_operator.not_equal.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005720 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "binary_operator.not_equal.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005721 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".binary_operator.not_equal.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005722 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "binary_operator.not_equal.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005723 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".binary_operator.not_equal.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005724 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "binary_operator.not_equal.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005725 end";
}
