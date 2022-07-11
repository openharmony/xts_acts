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
#include "../ActsKhrgles310003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_complet"
        "eness.incomplete_missing_attachment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002370 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_comple"
        "teness.incomplete_image_zero_width",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002371 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_comple"
        "teness.incomplete_image_zero_height",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002372 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_complete"
        "ness.incomplete_texture_3d_layer_oob",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002373 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_complete"
        "ness.incomplete_texture_2d_layer_oob",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002374 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completen"
        "ess.incomplete_texture_2d_mm_layer_oob",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002375 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completeness."
        "mutable_nbl_texture_expect_mipmap_complete",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002376 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completeness"
        ".mutable_nbl_texture_expect_cube_complete",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002377 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completen"
        "ess.expect_renderable_internal_format",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002378 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_complete"
        "ness.all_rbos_expect_same_numsamples",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002379 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completenes"
        "s.rbo_and_texture_expect_zero_numsamples",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002380 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_comp"
        "leteness.expect_equal_numsamples",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002381 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_"
        "completeness.status_tracking",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002382 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completeness"
        ".mutable_texture_missing_attachment_level",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002383 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.framebuffer_completeness."
        "immutable_texture_any_level_as_attachment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002384 end";
}
