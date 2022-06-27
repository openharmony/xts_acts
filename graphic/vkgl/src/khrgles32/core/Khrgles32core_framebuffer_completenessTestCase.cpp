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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_complet"
        "eness.incomplete_missing_attachment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001149 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_comple"
        "teness.incomplete_image_zero_width",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001150 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_comple"
        "teness.incomplete_image_zero_height",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001151 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001152, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001152 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_complete"
        "ness.incomplete_texture_3d_layer_oob",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001152 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001152 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001153, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001153 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_complete"
        "ness.incomplete_texture_2d_layer_oob",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001153 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001153 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001154, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001154 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completen"
        "ess.incomplete_texture_2d_mm_layer_oob",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001154 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001154 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001155, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001155 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness."
        "mutable_nbl_texture_expect_mipmap_complete",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001155 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001155 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001156, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001156 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness"
        ".mutable_nbl_texture_expect_cube_complete",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001156 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001156 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001157, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001157 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completen"
        "ess.expect_renderable_internal_format",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001157 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001157 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001158, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001158 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_complete"
        "ness.all_rbos_expect_same_numsamples",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001158 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001158 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001159, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001159 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completenes"
        "s.rbo_and_texture_expect_zero_numsamples",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001159 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001159 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001160, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001160 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_comp"
        "leteness.expect_equal_numsamples",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001160 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001160 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001161, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001161 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_"
        "completeness.status_tracking",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001161 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001161 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001162, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001162 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness"
        ".mutable_texture_missing_attachment_level",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001162 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001162 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001163, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001163 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness."
        "immutable_texture_any_level_as_attachment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001163 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001163 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001164, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001164 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness.cube"
        "_map_layered_attachment_valid_size_and_format",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001164 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001164 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001165, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001165 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness.cu"
        "be_map_layered_attachment_different_formats",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001165 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001165 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001166, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001166 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.framebuffer_completeness.c"
        "ube_map_layered_attachment_different_sizes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001166 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001166 end";
}
