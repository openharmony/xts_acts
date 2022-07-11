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

#include <climits>
#include <gtest/gtest.h>
#include "../Khrgles2BaseFunc.hpp"
#include "../ActsKhrgles20001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance_alpha start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance_alpha Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance_alpha end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgba Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb10_a2 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb10_a2 Unavaliable!";

    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb10_a2 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb5_a1 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb5_a1 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_int_2_10_10_10_rev_rgb5_a1 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_int_2_10_10_10_rev_rgb start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_int_2_10_10_10_rev_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_int_2_10_10_10_rev_rgb Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_int_2_10_10_10_rev_rgb end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_stencil_unsigned_int_24_8_depth_stencil start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_stencil_unsigned_int_24_8_depth_stencil",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_stencil_unsigned_int_24_8_depth_stencil Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_stencil_unsigned_int_24_8_depth_stencil end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb_linear Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_half_float_oes_rgb_linear end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba_linear Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_half_float_oes_rgba_linear end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f_linear Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_float_rgb32f_linear end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f_linear Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_float_rgba32f_linear end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgb5_a1 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgb5_a1 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgb5_a1 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba4 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba4 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_byte_rgba4 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb565 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_byte_rgb565 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba4 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba4 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_4_4_4_4_rgba4 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgba Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgb5_a1 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgb5_a1 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.rgba_unsigned_short_5_5_5_1_rgb5_a1 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb565 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.rgb_unsigned_short_5_6_5_rgb565 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance8_alpha8_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance8_alpha8_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance8_alpha8_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance8_alpha8_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance4_alpha4_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance4_alpha4_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance4_alpha4_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.luminance_alpha_unsigned_byte_luminance4_alpha4_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance8_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance8_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance8_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.luminance_unsigned_byte_luminance8_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha8_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha8_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha8_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.alpha_unsigned_byte_alpha8_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component16 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component16 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component16 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component16 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component16 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_short_depth_component16 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component24 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component24 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component24 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component32 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component32 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.texture2d.depth_component_unsigned_int_depth_component32 end";
}
