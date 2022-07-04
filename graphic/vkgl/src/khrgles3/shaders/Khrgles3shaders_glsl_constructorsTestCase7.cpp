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

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002816, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002816 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat2x3_mat2x3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002816 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002816 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002817, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002817 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat2x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002817 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002817 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002818, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002818 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat2x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002818 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002818 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002819, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002819 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat2x4_mat2x4_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002819 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002819 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002820, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002820 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat2x4_mat2x4_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002820 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002820 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002821, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002821 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec3_from_mat3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002821 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002821 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002822, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002822 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec3_from_mat3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002822 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002822 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002823, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002823 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec3_from_mat3_mat3_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002823 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002823 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002824, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002824 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec3_from_mat3_mat3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002824 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002824 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002825, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002825 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat3x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002825 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002825 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002826, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002826 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat3x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002826 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002826 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002827, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002827 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat3x2_mat3x2_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002827 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002827 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002828, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002828 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat3x2_mat3x2_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002828 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002828 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002829, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002829 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat3x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002829 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002829 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002830, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002830 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat3x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002830 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002830 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002831, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002831 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat3x4_mat3x4_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002831 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002831 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002832, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002832 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat3x4_mat3x4_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002832 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002832 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002833, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002833 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec3_from_mat4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002833 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002833 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002834, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002834 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec3_from_mat4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002834 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002834 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002835, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002835 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec3_from_mat4_mat4_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002835 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002835 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002836, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002836 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec3_from_mat4_mat4_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002836 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002836 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002837, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002837 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat4x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002837 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002837 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002838, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002838 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat4x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002838 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002838 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002839, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002839 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat4x2_mat4x2_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002839 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002839 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002840, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002840 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat4x2_mat4x2_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002840 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002840 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002841, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002841 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat4x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002841 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002841 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002842, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002842 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec3_from_mat4x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002842 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002842 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002843, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002843 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat4x3_mat4x3_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002843 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002843 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002844, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002844 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec3_from_mat4x3_mat4x3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002844 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002844 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002845, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002845 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.bvec3_from_bool_mat2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002845 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002845 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002846, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002846 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.bvec3_from_bool_mat2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002846 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002846 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002847, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002847 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "bvec3_from_bool_mat2_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002847 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002847 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002848, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002848 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "bvec3_from_bool_mat2_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002848 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002848 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002849, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002849 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat2x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002849 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002849 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002850, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002850 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat2x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002850 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002850 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002851, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002851 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat2x3_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002851 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002851 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002852, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002852 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat2x3_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002852 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002852 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002853, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002853 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat2x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002853 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002853 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002854, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002854 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat2x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002854 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002854 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002855, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002855 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat2x4_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002855 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002855 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002856, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002856 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat2x4_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002856 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002856 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002857, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002857 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.bvec3_from_bool_mat3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002857 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002857 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002858, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002858 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.bvec3_from_bool_mat3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002858 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002858 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002859, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002859 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "bvec3_from_bool_mat3_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002859 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002859 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002860, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002860 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "bvec3_from_bool_mat3_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002860 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002860 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002861, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002861 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat3x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002861 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002861 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002862, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002862 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat3x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002862 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002862 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat3x2_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002863 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat3x2_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002864 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat3x4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002865 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat3x4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002866 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat3x4_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002867 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat3x4_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002868 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.bvec3_from_bool_mat4_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002869 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constr"
        "uctors.bvec3_from_bool_mat4_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002870 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "bvec3_from_bool_mat4_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002871 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors."
        "bvec3_from_bool_mat4_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002872 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat4x2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002873 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat4x2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002874 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat4x2_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002875 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat4x2_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002876 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat4x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002877 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constru"
        "ctors.bvec3_from_bool_mat4x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002878 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat4x3_bool_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002879 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002880, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002880 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors.b"
        "vec3_from_bool_mat4x3_bool_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002880 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002880 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002881, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002881 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec4_from_mat2_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002881 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002881 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_cons"
        "tructors.bvec4_from_mat2_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002882 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec4_from_mat2_mat2_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002883 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructo"
        "rs.bvec4_from_mat2_mat2_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002884 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec4_from_mat2x3_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002885 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_const"
        "ructors.bvec4_from_mat2x3_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002886 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002887, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002887 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec4_from_mat2x3_mat2x3_invalid_vs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002887 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002887 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002888, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002888 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.glsl_constructors"
        ".bvec4_from_mat2x3_mat2x3_invalid_fs",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002888 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002888 end";
}
