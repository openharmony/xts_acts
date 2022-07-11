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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003831, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003831 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.v"
        "aried_rectangle.luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003831 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003831 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003832, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003832 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003832 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003832 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003833, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003833 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.vari"
        "ed_rectangle.luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003833 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003833 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003834, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003834 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003834 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003834 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003835, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003835 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003835 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003835 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003836, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003836 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.varied_rectangle.r8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003836 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003836 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003837, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003837 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.r8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003837 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003837 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003838, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003838 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.rg8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003838 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003838 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003839, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003839 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.v"
        "aried_rectangle.rg8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003839 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003839 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003840, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003840 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003840 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003840 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003841, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003841 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.v"
        "aried_rectangle.rgb8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003841 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003841 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003842, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003842 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003842 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003842 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003843, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003843 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003843 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003843 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003844, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003844 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003844 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003844 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003845, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003845 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003845 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003845 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003846, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003846 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.va"
        "ried_rectangle.rgba8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003846 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003846 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003847, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003847 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003847 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003847 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003848, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003848 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.v"
        "aried_rectangle.rgb10_a2ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003848 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003848 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003849, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003849 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003849 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003849 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003850, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003850 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.va"
        "ried_rectangle.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003850 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003850 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003851, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003851 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003851 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003851 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003852, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003852 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003852 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003852 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003853, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003853 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003853 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003853 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003854, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003854 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003854 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003854 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003855, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003855 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.r32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003855 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003855 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003856, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003856 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003856 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003856 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003857, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003857 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003857 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003857 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003858, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003858 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003858 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003858 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003859, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003859 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.var"
        "ied_rectangle.r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003859 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003859 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003860, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003860 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgb9_e5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003860 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003860 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003861, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003861 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.r8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003861 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003861 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003862, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003862 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.r8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003862 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003862 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.r16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003863 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.r16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003864 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.r32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003865 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.r32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003866 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.varied_rectangle.rg8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003867 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003868 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003869 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003870 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003871 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rg32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003872 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003873 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003874 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003875 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgb16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003876 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgb32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003877 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgb32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003878 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".varied_rectangle.rgba8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003879 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003880, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003880 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003880 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003880 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003881, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003881 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003881 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003881 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003882 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003883 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "varied_rectangle.rgba32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003884 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.varie"
        "d_rectangle.depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003885 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.varie"
        "d_rectangle.depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003886 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003887, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003887 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.varie"
        "d_rectangle.depth_component32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003887 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003887 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003888, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003888 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.vari"
        "ed_rectangle.depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003888 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003888 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003889, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003889 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.varie"
        "d_rectangle.depth32f_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003889 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003889 end";
}
