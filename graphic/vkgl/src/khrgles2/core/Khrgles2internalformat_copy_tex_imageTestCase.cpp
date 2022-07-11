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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgba Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.alpha start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.alpha Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.alpha end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance_alpha start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance_alpha Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance_alpha end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb5_a1 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb5_a1 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb5_a1 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb565 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb565 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgba4 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgba4 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgba4 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance4_alpha4_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.luminance4_alpha4_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance4_alpha4_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance4_alpha4_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance8_alpha8_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.luminance8_alpha8_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance8_alpha8_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance8_alpha8_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance8_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.luminance8_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance8_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.luminance8_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.alpha8_oes start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.alpha8_oes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.alpha8_oes Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.alpha8_oes end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb10_a2 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb10_a2 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb10_a2 end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb10 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.core.internalformat.copy_tex_image.rgb10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb10 Unavaliable!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    
    GTEST_LOG_(INFO) << "KHR-GLES2.core.internalformat.copy_tex_image.rgb10 end";
}
