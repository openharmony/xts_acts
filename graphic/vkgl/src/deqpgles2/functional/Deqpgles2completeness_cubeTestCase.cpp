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

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010890, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010890 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.co"
        "mpleteness.cube.npot_size_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010890 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010890 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010891, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010891 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.co"
        "mpleteness.cube.npot_size_level_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010891 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010891 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010892, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010892 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.compl"
        "eteness.cube.npot_size_level_0_pos_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010892 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010892 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010893, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010893 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.compl"
        "eteness.cube.npot_size_level_1_neg_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010893 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010893 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010894, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010894 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.comp"
        "leteness.cube.not_positive_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010894 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010894 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010895, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010895 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completene"
        "ss.cube.format_mismatch_rgb_rgba_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010895 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010895 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010896, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010896 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completene"
        "ss.cube.format_mismatch_rgba_rgb_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010896 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010896 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010897, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010897 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completeness.cube."
        "format_mismatch_luminance_luminance_alpha_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010897 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010897 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010898, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010898 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completeness.cube."
        "format_mismatch_luminance_alpha_luminance_level_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010898 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010898 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010899, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010899 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completeness."
        "cube.format_mismatch_rgb_rgba_level_0_pos_z",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010899 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010899 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010900, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010900 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.completeness."
        "cube.format_mismatch_rgba_rgb_level_0_neg_z",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010900 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010900 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010901, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010901 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.c"
        "ompleteness.cube.missing_level_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010901 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010901 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010902, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010902 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.c"
        "ompleteness.cube.missing_level_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010902 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010902 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010903, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010903 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.comp"
        "leteness.cube.missing_level_1_pos_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010903 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010903 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010904, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010904 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.comp"
        "leteness.cube.missing_level_3_neg_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010904 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010904 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010905, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010905 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "completeness.cube.npot_t_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010905 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010905 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010906, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010906 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "completeness.cube.npot_s_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010906 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010906 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010907, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010907 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.c"
        "ompleteness.cube.npot_all_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010907 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010907 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010908, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010908 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.comp"
        "leteness.cube.npot_mirrored_repeat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010908 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010908 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010909, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010909 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture"
        ".completeness.cube.extra_level",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010909 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010909 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010910, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010910 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture."
        "completeness.cube.empty_object",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010910 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010910 end";
}
