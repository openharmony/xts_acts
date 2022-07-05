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
#include "../ActsDeqpgles20013TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_s"
        "tencilbuffer.rebind_tex2d_rgb_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012635 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuf"
        "fer.rebind_tex2d_rgb_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012636 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_st"
        "encilbuffer.rebind_tex2d_rgba_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012637 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff"
        "er.rebind_tex2d_rgba_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012638 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_st"
        "encilbuffer.rebind_rbo_rgb565_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012639 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff"
        "er.rebind_rbo_rgb565_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012640 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_st"
        "encilbuffer.rebind_rbo_rgb5_a1_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012641 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuff"
        "er.rebind_rbo_rgb5_a1_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012642 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_s"
        "tencilbuffer.rebind_rbo_rgba4_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012643 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuf"
        "fer.rebind_rbo_rgba4_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012644 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_ste"
        "ncilbuffer.no_rebind_tex2d_rgb_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012645 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe"
        "r.no_rebind_tex2d_rgb_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012646 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_ste"
        "ncilbuffer.no_rebind_tex2d_rgba_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012647 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe"
        "r.no_rebind_tex2d_rgba_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012648 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_ste"
        "ncilbuffer.no_rebind_rbo_rgb565_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012649 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe"
        "r.no_rebind_rbo_rgb565_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012650 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_sten"
        "cilbuffer.no_rebind_rbo_rgb5_a1_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012651 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffer"
        ".no_rebind_rbo_rgb5_a1_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012652 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_ste"
        "ncilbuffer.no_rebind_rbo_rgba4_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012653 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.recreate_stencilbuffe"
        "r.no_rebind_rbo_rgba4_depth_component16_stencil_index8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012654 end";
}
