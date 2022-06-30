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

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".pbo_rectangle.luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003772 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003773 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pb"
        "o_rectangle.luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003774 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pix"
        "els.pbo_rectangle.rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003775 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003776 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pix"
        "els.pbo_rectangle.r8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003777 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".pbo_rectangle.r8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003778 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pix"
        "els.pbo_rectangle.rg8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003779 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".pbo_rectangle.rg8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003780 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003781 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "pbo_rectangle.rgb8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003782 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003783 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003784 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003785 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003786 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "pbo_rectangle.rgba8_snorm",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003787 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".pbo_rectangle.rgb10_a2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003788 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels."
        "pbo_rectangle.rgb10_a2ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003789 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.srgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003790 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.p"
        "bo_rectangle.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003791 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003792 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rg16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003793 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003794 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgba16f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003795 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003796 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rg32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003797 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003798 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgba32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003799 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pb"
        "o_rectangle.r11f_g11f_b10f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003800 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb9_e5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003801 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pix"
        "els.pbo_rectangle.r8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003802 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003803 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003804 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003805 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003806, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003806 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003806 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003806 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003807, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003807 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.r32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003807 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003807 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003808, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003808 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rg8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003808 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003808 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003809, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003809 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rg8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003809 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003809 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003810, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003810 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rg16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003810 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003810 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003811, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003811 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rg16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003811 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003811 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003812, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003812 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rg32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003812 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003812 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003813, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003813 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rg32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003813 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003813 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003814, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003814 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixe"
        "ls.pbo_rectangle.rgb8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003814 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003814 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003815, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003815 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003815 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003815 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003816, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003816 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003816 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003816 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003817, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003817 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003817 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003817 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003818, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003818 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003818 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003818 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003819, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003819 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgb32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003819 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003819 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003820, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003820 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgba8i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003820 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003820 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003821, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003821 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgba8ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003821 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003821 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003822, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003822 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgba16i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003822 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003822 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003823, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003823 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".pbo_rectangle.rgba16ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003823 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003823 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003824, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003824 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixel"
        "s.pbo_rectangle.rgba32i",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003824 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003824 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003825, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003825 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels"
        ".pbo_rectangle.rgba32ui",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003825 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003825 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003826, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003826 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pbo"
        "_rectangle.depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003826 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003826 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003827, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003827 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pbo"
        "_rectangle.depth_component24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003827 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003827 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003828, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003828 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pbo_"
        "rectangle.depth_component32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003828 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003828 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003829, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003829 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pbo"
        "_rectangle.depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003829 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003829 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003830, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003830 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.packed_pixels.pbo"
        "_rectangle.depth32f_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003830 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003830 end";
}
