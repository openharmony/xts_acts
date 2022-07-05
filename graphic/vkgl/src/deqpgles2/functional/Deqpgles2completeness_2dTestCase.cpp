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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20011TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.textu"
        "re.completeness.2d.npot_size",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010871 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.c"
        "ompleteness.2d.npot_size_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010872 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.c"
        "ompleteness.2d.npot_size_level_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010873 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.com"
        "pleteness.2d.not_positive_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010874 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.compl"
        "eteness.2d.format_mismatch_rgb_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010875 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.compl"
        "eteness.2d.format_mismatch_rgba_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010876 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completeness."
        "2d.format_mismatch_luminance_luminance_alpha",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010877 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completeness."
        "2d.format_mismatch_luminance_alpha_luminance",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010878 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "completeness.2d.missing_level_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010879 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010880, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010880 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "completeness.2d.missing_level_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010880 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010880 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010881, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010881 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.co"
        "mpleteness.2d.last_level_missing",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010881 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010881 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".completeness.2d.npot_t_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010882 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".completeness.2d.npot_s_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010883 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "completeness.2d.npot_all_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010884 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.com"
        "pleteness.2d.npot_mirrored_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010885 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.c"
        "ompleteness.2d.repeat_width_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010886 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010887, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010887 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.co"
        "mpleteness.2d.repeat_height_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010887 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010887 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010888, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010888 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.textur"
        "e.completeness.2d.extra_level",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010888 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010888 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010889, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010889 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".completeness.2d.empty_object",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010889 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010889 end";
}
