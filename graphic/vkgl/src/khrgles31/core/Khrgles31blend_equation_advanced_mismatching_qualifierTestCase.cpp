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

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.mismatching_qualifier.GL_MULTIPLY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001748 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.mismatching_qualifier.GL_SCREEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001749 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.mismatching_qualifier.GL_OVERLAY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001750 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.mismatching_qualifier.GL_DARKEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001751 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.mismatching_qualifier.GL_LIGHTEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001752 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_COLORDODGE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001753 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_COLORBURN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001754 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_HARDLIGHT_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001755 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_SOFTLIGHT_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001756 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_DIFFERENCE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001757 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_EXCLUSION_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001758 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.mismatching_qualifier.GL_HSL_HUE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001759 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced.m"
        "ismatching_qualifier.GL_HSL_SATURATION_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001760 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".mismatching_qualifier.GL_HSL_COLOR_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001761 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001762, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001762 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced.m"
        "ismatching_qualifier.GL_HSL_LUMINOSITY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001762 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001762 end";
}
