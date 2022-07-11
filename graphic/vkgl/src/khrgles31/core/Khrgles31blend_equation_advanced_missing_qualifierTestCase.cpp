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
#include "../ActsKhrgles310002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001763, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001763 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advan"
        "ced.missing_qualifier.GL_MULTIPLY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001763 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001763 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_adva"
        "nced.missing_qualifier.GL_SCREEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001764 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advan"
        "ced.missing_qualifier.GL_OVERLAY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001765 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_adva"
        "nced.missing_qualifier.GL_DARKEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001766 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advan"
        "ced.missing_qualifier.GL_LIGHTEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001767 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_COLORDODGE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001768 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_COLORBURN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001769 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_HARDLIGHT_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001770 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_SOFTLIGHT_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001771 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_DIFFERENCE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001772 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_EXCLUSION_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001773 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advan"
        "ced.missing_qualifier.GL_HSL_HUE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001774 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".missing_qualifier.GL_HSL_SATURATION_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001775 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.missing_qualifier.GL_HSL_COLOR_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001776 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".missing_qualifier.GL_HSL_LUMINOSITY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001777 end";
}
