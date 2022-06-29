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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_unsigned_byte_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002266 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_unsigned_byte_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002267 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rgba_unsigned_short_4_4_4_4_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002268 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d.lu"
        "minance_alpha_unsigned_byte_luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002269 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textur"
        "e2d.luminance_unsigned_byte_luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002270 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.te"
        "xture2d.alpha_unsigned_byte_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002271 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2"
        "d.rgba_unsigned_int_2_10_10_10_rev_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002272 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d."
        "rgba_unsigned_int_2_10_10_10_rev_rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002273 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d"
        ".rgba_unsigned_int_2_10_10_10_rev_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002274 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture"
        "2d.rgb_unsigned_int_2_10_10_10_rev_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002275 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d.de"
        "pth_component_unsigned_short_depth_component",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002276 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d.d"
        "epth_component_unsigned_int_depth_component",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002277 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d.de"
        "pth_stencil_unsigned_int_24_8_depth_stencil",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002278 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_half_float_oes_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002279 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_half_float_oes_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002280 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.text"
        "ure2d.rgb_half_float_oes_rgb_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002281 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rgba_half_float_oes_rgba_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002282 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalform"
        "at.texture2d.rgb_float_rgb32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002283 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalforma"
        "t.texture2d.rgba_float_rgba32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002284 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgb_float_rgb32f_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002285 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.te"
        "xture2d.rgba_float_rgba32f_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002286 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_unsigned_byte_rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002287 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.te"
        "xture2d.rgba_unsigned_byte_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002288 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_unsigned_byte_rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002289 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rgba_unsigned_byte_srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002290 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgba_byte_rgba8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002291 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textur"
        "e2d.rgba_unsigned_short_4_4_4_4_rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002292 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture"
        "2d.rgba_unsigned_short_5_5_5_1_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002293 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_half_float_rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002294 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalforma"
        "t.texture2d.rgba_float_rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002295 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textur"
        "e2d.rgba_integer_unsigned_byte_rgba8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002296 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_integer_byte_rgba8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002297 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture"
        "2d.rgba_integer_unsigned_short_rgba16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002298 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.te"
        "xture2d.rgba_integer_short_rgba16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002299 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textur"
        "e2d.rgba_integer_unsigned_int_rgba32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002300 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgba_integer_int_rgba32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002301 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d.rgba_"
        "integer_unsigned_int_2_10_10_10_rev_rgb10_a2ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002302 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_unsigned_byte_rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002303 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgb_unsigned_byte_rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002304 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgb_unsigned_byte_srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002305 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rgb_unsigned_short_5_6_5_rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002306 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture2d.rgb"
        "_unsigned_int_10f_11f_11f_rev_r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002307 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.texture"
        "2d.rgb_unsigned_int_5_9_9_9_rev_rgb9_e5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002308 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_half_float_rgb16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002309 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.text"
        "ure2d.rgb_half_float_r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002310 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_half_float_rgb9_e5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002311 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalform"
        "at.texture2d.rgb_float_rgb16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002312 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgb_float_r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002313 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalforma"
        "t.texture2d.rgb_float_rgb9_e5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002314 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rgb_integer_unsigned_byte_rgb8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002315 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_integer_byte_rgb8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002316 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textur"
        "e2d.rgb_integer_unsigned_short_rgb16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002317 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.t"
        "exture2d.rgb_integer_short_rgb16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002318 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rgb_integer_unsigned_int_rgb32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002319 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rgb_integer_int_rgb32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002320 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.rg_unsigned_byte_rg8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002321 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.rg_half_float_rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002322 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalfor"
        "mat.texture2d.rg_float_rg32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002323 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalfor"
        "mat.texture2d.rg_float_rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002324 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.text"
        "ure2d.rg_integer_unsigned_byte_rg8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002325 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.rg_integer_byte_rg8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002326 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.rg_integer_unsigned_short_rg16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002327 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.rg_integer_short_rg16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002328 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.text"
        "ure2d.rg_integer_unsigned_int_rg32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002329 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.rg_integer_int_rg32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002330 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.red_unsigned_byte_r8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002331 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.red_half_float_r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002332 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalfor"
        "mat.texture2d.red_float_r32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002333 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalfor"
        "mat.texture2d.red_float_r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002334 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.text"
        "ure2d.red_integer_unsigned_byte_r8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002335 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat"
        ".texture2d.red_integer_byte_r8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002336 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat.textu"
        "re2d.red_integer_unsigned_short_r16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002337 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.internalformat."
        "texture2d.red_integer_short_r16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002338 end";
}