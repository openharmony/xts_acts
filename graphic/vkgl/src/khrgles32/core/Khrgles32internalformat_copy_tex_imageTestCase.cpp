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

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internal"
        "format.copy_tex_image.rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001113 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.copy_tex_image.rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001114 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.copy_tex_image.alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001115 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalfor"
        "mat.copy_tex_image.luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001116 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalformat"
        ".copy_tex_image.luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001117 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.copy_tex_image.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001118 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalfo"
        "rmat.copy_tex_image.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001119 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalfo"
        "rmat.copy_tex_image.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001120 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.copy_tex_image.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001121 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.copy_tex_image.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001122 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalforma"
        "t.copy_tex_image.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001123 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.copy_tex_image.srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001124 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalformat"
        ".copy_tex_image.r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001125 end";
}
