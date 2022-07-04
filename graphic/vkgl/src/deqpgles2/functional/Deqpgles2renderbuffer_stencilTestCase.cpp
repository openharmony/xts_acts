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
#include "../ActsDeqpgles20013TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable."
        "renderbuffer.stencil.depth_component_unsigned_short",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012706 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable"
        ".renderbuffer.stencil.depth_component_unsigned_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012707 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.red_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012708 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.r"
        "enderable.renderbuffer.stencil.red_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012709 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.red_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012710 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.rgb_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012711 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.r"
        "enderable.renderbuffer.stencil.rgb_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012712 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderab"
        "le.renderbuffer.stencil.rgb_unsigned_short_5_6_5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012713 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable.r"
        "enderbuffer.stencil.rgb_unsigned_int_2_10_10_10_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012714 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable.r"
        "enderbuffer.stencil.rgb_unsigned_int_10f_11f_11f_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012715 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.rgb_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012716 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.rgba_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012717 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.r"
        "enderable.renderbuffer.stencil.rgba_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012718 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable"
        ".renderbuffer.stencil.rgba_unsigned_short_4_4_4_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012719 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable"
        ".renderbuffer.stencil.rgba_unsigned_short_5_5_5_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012720 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable.r"
        "enderbuffer.stencil.rgba_unsigned_int_2_10_10_10_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012721 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.render"
        "able.renderbuffer.stencil.rgba_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012722 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completenes"
        "s.renderable.renderbuffer.stencil.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012723 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.rgb10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012724 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012725 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.renderbuffer.stencil.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012726 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012727 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.renderbuffer.stencil.rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012728 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012729 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012730 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.depth_component32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012731 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rend"
        "erable.renderbuffer.stencil.rg_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012732 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.renderbuffer.stencil.rg_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012733 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.rg_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012734 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.renderbuffer.stencil.r8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012735 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completenes"
        "s.renderable.renderbuffer.stencil.rg8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012736 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completenes"
        "s.renderable.renderbuffer.stencil.r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012737 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012738 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderable.r"
        "enderbuffer.stencil.depth_stencil_unsigned_int_24_8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012739 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.renderbuffer.stencil.rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012740 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.rgb16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012741 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rend"
        "erable.renderbuffer.stencil.depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012742 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.ren"
        "derable.renderbuffer.stencil.r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012743 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.renderbuffer.stencil.srgb_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012744 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012745 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderab"
        "le.renderbuffer.stencil.srgb_alpha_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012746 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.renderbuffer.stencil.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012747 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.ren"
        "derable.renderbuffer.stencil.stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012748 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.renderbuffer.stencil.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012749 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.renderbuffer.stencil.sr8_ext",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012750 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.renderbuffer.stencil.srg8_ext",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012751 end";
}
