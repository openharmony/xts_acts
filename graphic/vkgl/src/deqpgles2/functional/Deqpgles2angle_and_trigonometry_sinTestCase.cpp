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

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.sin.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005764 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.sin.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005765 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005766 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.sin.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005767 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005768 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.sin.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005769 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005770 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005771 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005772 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.sin.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005773 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005774 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005775 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005776 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.sin.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005777 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005778 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005779 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005780 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005781 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005782 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005783 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005784 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005785 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.an"
        "gle_and_trigonometry.sin.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005786 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.ang"
        "le_and_trigonometry.sin.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005787 end";
}
