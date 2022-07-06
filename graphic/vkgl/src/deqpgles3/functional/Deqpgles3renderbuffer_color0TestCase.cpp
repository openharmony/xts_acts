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
#include "../ActsDeqpgles30031TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030862, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030862 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderable."
        "renderbuffer.color0.depth_component_unsigned_short",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030862 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030862 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderable"
        ".renderbuffer.color0.depth_component_unsigned_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030863 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.red_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030864 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.red_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030865 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rende"
        "rable.renderbuffer.color0.red_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030866 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.rgb_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030867 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderab"
        "le.renderbuffer.color0.rgb_unsigned_short_5_6_5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030868 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderable."
        "renderbuffer.color0.rgb_unsigned_int_2_10_10_10_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030869 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderable.r"
        "enderbuffer.color0.rgb_unsigned_int_10f_11f_11f_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030870 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rende"
        "rable.renderbuffer.color0.rgba_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030871 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderabl"
        "e.renderbuffer.color0.rgba_unsigned_short_4_4_4_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030872 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderabl"
        "e.renderbuffer.color0.rgba_unsigned_short_5_5_5_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030873 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderable.r"
        "enderbuffer.color0.rgba_unsigned_int_2_10_10_10_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030874 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030875 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rgb10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030876 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030877 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030878 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030879 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030880, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030880 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030880 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030880 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030881, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030881 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030881 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030881 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030882 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.depth_component32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030883 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.rg_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030884 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.rg_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030885 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.rg_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030886 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030887, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030887 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completene"
        "ss.renderable.renderbuffer.color0.r8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030887 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030887 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030888, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030888 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completene"
        "ss.renderable.renderbuffer.color0.rg8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030888 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030888 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030889, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030889 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030889 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030889 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030890, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030890 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030890 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030890 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030891, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030891 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030891 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030891 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030892, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030892 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rg32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030892 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030892 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030893, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030893 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completene"
        "ss.renderable.renderbuffer.color0.r8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030893 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030893 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030894, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030894 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030894 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030894 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030895, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030895 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030895 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030895 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030896, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030896 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030896 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030896 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030897, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030897 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030897 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030897 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030898, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030898 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.r32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030898 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030898 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030899, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030899 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rg8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030899 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030899 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030900, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030900 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rg8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030900 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030900 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030901, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030901 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rg16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030901 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030901 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030902, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030902 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rg16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030902 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030902 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030903, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030903 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rg32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030903 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030903 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030904, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030904 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rg32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030904 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030904 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030905, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030905 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderable."
        "renderbuffer.color0.depth_stencil_unsigned_int_24_8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030905 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030905 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030906, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030906 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgba32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030906 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030906 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030907, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030907 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030907 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030907 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030908, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030908 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030908 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030908 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030909, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030909 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.ren"
        "derable.renderbuffer.color0.r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030909 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030909 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030910, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030910 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb9_e5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030910 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030910 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030911, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030911 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rende"
        "rable.renderbuffer.color0.srgb_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030911 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030911 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030912, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030912 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030912 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030912 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030913, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030913 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.renderab"
        "le.renderbuffer.color0.srgb_alpha_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030913 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030913 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030914, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030914 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.re"
        "nderable.renderbuffer.color0.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030914 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030914 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030915, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030915 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rende"
        "rable.renderbuffer.color0.depth_component32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030915 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030915 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030916, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030916 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.rend"
        "erable.renderbuffer.color0.depth32f_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030916 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030916 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030917, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030917 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.ren"
        "derable.renderbuffer.color0.stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030917 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030917 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030918, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030918 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030918 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030918 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030919, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030919 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.rgba32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030919 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030919 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030920, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030920 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030920 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030920 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030921, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030921 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.rgba16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030921 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030921 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030922, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030922 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030922 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030922 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030923, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030923 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgba8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030923 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030923 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030924, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030924 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030924 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030924 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030925, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030925 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgba32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030925 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030925 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030926, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030926 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030926 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030926 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030927, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030927 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgba16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030927 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030927 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030928, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030928 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgb16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030928 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030928 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030929, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030929 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.rgba8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030929 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030929 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030930, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030930 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completenes"
        "s.renderable.renderbuffer.color0.rgb8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030930 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030930 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030931, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030931 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.r8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030931 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030931 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030932, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030932 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.rg8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030932 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030932 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030933, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030933 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.r"
        "enderable.renderbuffer.color0.rgb8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030933 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030933 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030934, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030934 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.r"
        "enderable.renderbuffer.color0.rgba8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030934 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030934 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030935, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030935 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness"
        ".renderable.renderbuffer.color0.sr8_ext",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030935 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030935 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030936, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030936 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness."
        "renderable.renderbuffer.color0.srg8_ext",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030936 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030936 end";
}

static HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030937, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_030937 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.completeness.r"
        "enderable.renderbuffer.color0.rgb10_a2ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30031TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30031TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30031TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30031TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30031TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_030937 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_030937 end";
}
