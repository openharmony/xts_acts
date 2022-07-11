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

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.BlendEquationSeparate.GL_MULTIPLY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001731 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.BlendEquationSeparate.GL_SCREEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001732 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.BlendEquationSeparate.GL_OVERLAY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001733 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanc"
        "ed.BlendEquationSeparate.GL_DARKEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001734 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.BlendEquationSeparate.GL_LIGHTEN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001735 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_COLORDODGE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001736 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_COLORBURN_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001737 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_HARDLIGHT_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001738 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_SOFTLIGHT_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001739 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_DIFFERENCE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001740 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_EXCLUSION_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001741 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advance"
        "d.BlendEquationSeparate.GL_HSL_HUE_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001742 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced.B"
        "lendEquationSeparate.GL_HSL_SATURATION_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001743 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced"
        ".BlendEquationSeparate.GL_HSL_COLOR_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001744 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation_advanced.B"
        "lendEquationSeparate.GL_HSL_LUMINOSITY_KHR",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001745 end";
}
