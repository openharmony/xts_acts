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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30022TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021823, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021823 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.textur"
        "e.format.unsized.alpha_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021823 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021823 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021824, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021824 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture"
        ".format.unsized.alpha_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021824 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021824 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021825, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021825 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture"
        ".format.unsized.alpha_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021825 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021825 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021826, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021826 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture."
        "format.unsized.alpha_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021826 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021826 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021827, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021827 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.f"
        "ormat.unsized.alpha_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021827 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021827 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021828, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021828 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.fo"
        "rmat.unsized.alpha_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021828 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021828 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021829, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021829 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.textur"
        "e.format.unsized.alpha_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021829 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021829 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021830, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021830 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture"
        ".format.unsized.alpha_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021830 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021830 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021831, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021831 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture."
        "format.unsized.luminance_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021831 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021831 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021832, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021832 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.f"
        "ormat.unsized.luminance_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021832 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021832 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021833, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021833 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.f"
        "ormat.unsized.luminance_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021833 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021833 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021834, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021834 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.fo"
        "rmat.unsized.luminance_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021834 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021834 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021835, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021835 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.for"
        "mat.unsized.luminance_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021835 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021835 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021836, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021836 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.form"
        "at.unsized.luminance_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021836 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021836 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021837, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021837 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture."
        "format.unsized.luminance_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021837 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021837 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021838, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021838 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.f"
        "ormat.unsized.luminance_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021838 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021838 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021839, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021839 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.for"
        "mat.unsized.luminance_alpha_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021839 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021839 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021840, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021840 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.form"
        "at.unsized.luminance_alpha_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021840 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021840 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021841, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021841 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.form"
        "at.unsized.luminance_alpha_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021841 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021841 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021842, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021842 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.luminance_alpha_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021842 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021842 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021843, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021843 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format"
        ".unsized.luminance_alpha_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021843 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021843 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021844, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021844 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format."
        "unsized.luminance_alpha_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021844 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021844 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021845, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021845 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.for"
        "mat.unsized.luminance_alpha_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021845 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021845 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021846, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021846 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.form"
        "at.unsized.luminance_alpha_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021846 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021846 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021847, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021847 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgb_unsigned_short_5_6_5_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021847 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021847 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021848, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021848 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgb_unsigned_short_5_6_5_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021848 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021848 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021849, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021849 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.un"
        "sized.rgb_unsigned_short_5_6_5_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021849 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021849 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021850, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021850 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.un"
        "sized.rgb_unsigned_short_5_6_5_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021850 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021850 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021851, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021851 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsi"
        "zed.rgb_unsigned_short_5_6_5_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021851 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021851 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021852, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021852 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsi"
        "zed.rgb_unsigned_short_5_6_5_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021852 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021852 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021853, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021853 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgb_unsigned_short_5_6_5_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021853 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021853 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021854, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021854 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgb_unsigned_short_5_6_5_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021854 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021854 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021855, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021855 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.form"
        "at.unsized.rgb_unsigned_byte_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021855 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021855 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021856, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021856 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgb_unsigned_byte_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021856 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021856 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021857, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021857 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgb_unsigned_byte_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021857 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021857 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021858, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021858 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format"
        ".unsized.rgb_unsigned_byte_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021858 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021858 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021859, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021859 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format."
        "unsized.rgb_unsigned_byte_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021859 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021859 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021860, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021860 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgb_unsigned_byte_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021860 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021860 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021861, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021861 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.form"
        "at.unsized.rgb_unsigned_byte_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021861 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021861 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021862, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021862 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgb_unsigned_byte_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021862 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021862 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.un"
        "sized.rgba_unsigned_short_4_4_4_4_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021863 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.uns"
        "ized.rgba_unsigned_short_4_4_4_4_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021864 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.uns"
        "ized.rgba_unsigned_short_4_4_4_4_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021865 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsi"
        "zed.rgba_unsigned_short_4_4_4_4_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021866 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsiz"
        "ed.rgba_unsigned_short_4_4_4_4_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021867 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsize"
        "d.rgba_unsigned_short_4_4_4_4_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021868 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.un"
        "sized.rgba_unsigned_short_4_4_4_4_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021869 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.uns"
        "ized.rgba_unsigned_short_4_4_4_4_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021870 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.un"
        "sized.rgba_unsigned_short_5_5_5_1_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021871 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.uns"
        "ized.rgba_unsigned_short_5_5_5_1_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021872 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.uns"
        "ized.rgba_unsigned_short_5_5_5_1_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021873 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsi"
        "zed.rgba_unsigned_short_5_5_5_1_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021874 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsiz"
        "ed.rgba_unsigned_short_5_5_5_1_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021875 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.unsize"
        "d.rgba_unsigned_short_5_5_5_1_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021876 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.un"
        "sized.rgba_unsigned_short_5_5_5_1_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021877 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.uns"
        "ized.rgba_unsigned_short_5_5_5_1_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021878 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgba_unsigned_byte_2d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021879 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021880, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021880 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgba_unsigned_byte_2d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021880 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021880 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021881, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021881 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format"
        ".unsized.rgba_unsigned_byte_cube_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021881 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021881 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format"
        ".unsized.rgba_unsigned_byte_cube_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021882 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgba_unsigned_byte_2d_array_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021883 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.format.u"
        "nsized.rgba_unsigned_byte_2d_array_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021884 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgba_unsigned_byte_3d_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021885 end";
}

static HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_021886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.texture.forma"
        "t.unsized.rgba_unsigned_byte_3d_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30022TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30022TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30022TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30022TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30022TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_021886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_021886 end";
}
