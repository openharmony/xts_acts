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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001199, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001199 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compress"
        "ed_format.format.r11_eac",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001199 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001199 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001200, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001200 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.signed_r11_eac",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001200 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001200 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001201, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001201 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compress"
        "ed_format.format.rg11_eac",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001201 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001201 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001202, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001202 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_f"
        "ormat.format.signed_rg11_eac",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001202 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001202 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001203, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001203 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compresse"
        "d_format.format.rgb8_etc2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001203 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001203 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001204, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001204 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compresse"
        "d_format.format.srgb8_etc2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001204 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001204 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001205, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001205 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_format.f"
        "ormat.rgb8_punchthrough_alpha1_etc2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001205 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001205 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001206, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001206 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_format.f"
        "ormat.srgb8_punchthrough_alpha1_etc2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001206 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001206 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001207, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001207 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba8_etc2_eac",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001207 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001207 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001208, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001208 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_etc2_eac",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001208 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001208 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001209, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001209 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_4x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001209 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001209 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001210, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001210 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_5x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001210 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001210 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_5x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001211 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_6x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001212 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001213, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001213 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_6x6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001213 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001213 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001214, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001214 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_8x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001214 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001214 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001215, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001215 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_8x6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001215 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001215 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001216, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001216 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_8x8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001216 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001216 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001217, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001217 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_10x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001217 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001217 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001218, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001218 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_10x6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001218 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001218 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001219, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001219 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_"
        "format.format.rgba_astc_10x8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001219 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001219 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001220, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001220 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_f"
        "ormat.format.rgba_astc_10x10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001220 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001220 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001221, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001221 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_f"
        "ormat.format.rgba_astc_12x10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001221 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001221 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001222, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001222 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_f"
        "ormat.format.rgba_astc_12x12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001222 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001222 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001223, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001223 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_4x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001223 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001223 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_5x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001224 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_5x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001225 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_6x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001226 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_6x6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001227 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_8x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001228 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_8x6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001229 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_8x8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001230 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_10x5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001231 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_10x6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001232 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_form"
        "at.format.srgb8_alpha8_astc_10x8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001233 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_forma"
        "t.format.srgb8_alpha8_astc_10x10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001234 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_forma"
        "t.format.srgb8_alpha8_astc_12x10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001235 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.compressed_forma"
        "t.format.srgb8_alpha8_astc_12x12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001236 end";
}
