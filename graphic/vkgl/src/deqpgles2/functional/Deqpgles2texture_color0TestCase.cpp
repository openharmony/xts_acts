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

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderab"
        "le.texture.color0.depth_component_unsigned_short",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012798 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rendera"
        "ble.texture.color0.depth_component_unsigned_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012799 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.red_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012800 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completenes"
        "s.renderable.texture.color0.red_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012801 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.red_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012802 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.rgb_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012803 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completenes"
        "s.renderable.texture.color0.rgb_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012804 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.texture.color0.rgb_unsigned_short_5_6_5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012805 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012806, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012806 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderabl"
        "e.texture.color0.rgb_unsigned_int_2_10_10_10_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012806 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012806 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012807, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012807 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderabl"
        "e.texture.color0.rgb_unsigned_int_10f_11f_11f_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012807 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012807 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012808, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012808 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.rgb_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012808 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012808 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012809, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012809 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.rgba_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012809 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012809 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012810, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012810 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completenes"
        "s.renderable.texture.color0.rgba_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012810 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012810 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012811, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012811 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rendera"
        "ble.texture.color0.rgba_unsigned_short_4_4_4_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012811 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012811 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012812, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012812 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rendera"
        "ble.texture.color0.rgba_unsigned_short_5_5_5_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012812 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012812 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012813, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012813 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderabl"
        "e.texture.color0.rgba_unsigned_int_2_10_10_10_rev",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012813 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012813 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012814, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012814 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.ren"
        "derable.texture.color0.rgba_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012814 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012814 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012815, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012815 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.complete"
        "ness.renderable.texture.color0.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012815 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012815 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012816, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012816 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completen"
        "ess.renderable.texture.color0.rgb10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012816 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012816 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012817, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012817 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completen"
        "ess.renderable.texture.color0.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012817 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012817 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012818, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012818 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.texture.color0.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012818 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012818 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012819, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012819 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completen"
        "ess.renderable.texture.color0.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012819 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012819 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012820, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012820 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.texture.color0.rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012820 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012820 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012821, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012821 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012821 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012821 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012822, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012822 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012822 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012822 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012823, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012823 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.depth_component32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012823 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012823 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012824, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012824 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.r"
        "enderable.texture.color0.rg_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012824 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012824 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012825, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012825 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.texture.color0.rg_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012825 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012825 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012826, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012826 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.rg_half_float_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012826 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012826 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012827, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012827 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.complet"
        "eness.renderable.texture.color0.r8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012827 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012827 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012828, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012828 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.complete"
        "ness.renderable.texture.color0.rg8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012828 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012828 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012829, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012829 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.complete"
        "ness.renderable.texture.color0.r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012829 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012829 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012830, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012830 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completen"
        "ess.renderable.texture.color0.rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012830 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012830 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012831, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012831 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.renderabl"
        "e.texture.color0.depth_stencil_unsigned_int_24_8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012831 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012831 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012832, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012832 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.texture.color0.rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012832 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012832 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012833, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012833 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.r"
        "enderable.texture.color0.depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012833 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012833 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012834, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012834 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.texture.color0.r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012834 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012834 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012835, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012835 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.re"
        "nderable.texture.color0.srgb_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012835 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012835 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012836, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012836 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completen"
        "ess.renderable.texture.color0.srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012836 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012836 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012837, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012837 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness.rende"
        "rable.texture.color0.srgb_alpha_unsigned_byte",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012837 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012837 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012838, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012838 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness"
        ".renderable.texture.color0.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012838 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012838 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012839, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012839 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completeness."
        "renderable.texture.color0.stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012839 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012839 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012840, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012840 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completen"
        "ess.renderable.texture.color0.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012840 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012840 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012841, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012841 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.texture.color0.sr8_ext",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012841 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012841 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012842, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012842 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.completene"
        "ss.renderable.texture.color0.srg8_ext",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012842 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012842 end";
}
