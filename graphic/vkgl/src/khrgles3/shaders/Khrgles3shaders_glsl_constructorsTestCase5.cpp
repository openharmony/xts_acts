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
#include "../ActsKhrgles30003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat2x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002670 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat2x3_mat2x3_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002671 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat2x3_mat2x3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002672 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat2x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002673 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat2x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002674 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat2x4_mat2x4_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002675 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat2x4_mat2x4_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002676 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.ivec4_from_mat3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002677 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.ivec4_from_mat3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002678 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.ivec4_from_mat3_mat3_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002679 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.ivec4_from_mat3_mat3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002680 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat3x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002681 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat3x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002682 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat3x2_mat3x2_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002683 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat3x2_mat3x2_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002684 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat3x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002685 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat3x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002686 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat3x4_mat3x4_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002687 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat3x4_mat3x4_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002688 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.ivec4_from_mat4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002689 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.ivec4_from_mat4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002690 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.ivec4_from_mat4_mat4_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002691 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.ivec4_from_mat4_mat4_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002692 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat4x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002693 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat4x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002694 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat4x2_mat4x2_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002695 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat4x2_mat4x2_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002696 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat4x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002697 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.ivec4_from_mat4x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002698 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat4x3_mat4x3_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002699 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_mat4x3_mat4x3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002700 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.ivec4_from_int_mat2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002701 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.ivec4_from_int_mat2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002702 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_int_mat2_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002703 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_int_mat2_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002704 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat2x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002705 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat2x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002706 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat2x3_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002707 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat2x3_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002708 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat2x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002709 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat2x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002710 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat2x4_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002711 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat2x4_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002712 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.ivec4_from_int_mat3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002713 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.ivec4_from_int_mat3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002714 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_int_mat3_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002715 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_int_mat3_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002716 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat3x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002717 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat3x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002718 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat3x2_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002719 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat3x2_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002720 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat3x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002721 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat3x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002722 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat3x4_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002723 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat3x4_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002724 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.ivec4_from_int_mat4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002725 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.ivec4_from_int_mat4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002726 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_int_mat4_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002727 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".ivec4_from_int_mat4_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002728 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat4x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002729 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat4x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002730 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat4x2_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002731 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat4x2_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002732 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat4x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002733 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.ivec4_from_int_mat4x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002734 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat4x3_int_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002735 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "ivec4_from_int_mat4x3_int_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002736 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec2_from_mat2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002737 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec2_from_mat2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002738 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec2_from_mat2_mat2_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002739 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec2_from_mat2_mat2_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002740 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec2_from_mat2x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002741 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec2_from_mat2x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002742 end";
}
