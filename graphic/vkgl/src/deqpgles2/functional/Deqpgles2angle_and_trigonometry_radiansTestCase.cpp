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

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle_"
        "and_trigonometry.radians.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005732 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle_a"
        "nd_trigonometry.radians.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005733 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005734 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle_"
        "and_trigonometry.radians.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005735 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005736 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle_"
        "and_trigonometry.radians.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005737 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.radians.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005738 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005739 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005740 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle_"
        "and_trigonometry.radians.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005741 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.radians.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005742 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005743 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005744 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle_"
        "and_trigonometry.radians.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005745 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angl"
        "e_and_trigonometry.radians.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005746 end";
}

static HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.angle"
        "_and_trigonometry.radians.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005747 end";
}
