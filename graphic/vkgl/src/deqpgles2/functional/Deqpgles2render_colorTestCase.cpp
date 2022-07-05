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

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo."
        "render.color.mix_tex2d_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012462 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.co"
        "lor.mix_tex2d_rgb_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012463 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo."
        "render.color.mix_tex2d_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012464 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.co"
        "lor.mix_tex2d_rgba_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012465 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.re"
        "nder.color.mix_npot_tex2d_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012466 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.colo"
        "r.mix_npot_tex2d_rgb_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012467 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.ren"
        "der.color.mix_npot_tex2d_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012468 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.color"
        ".mix_npot_tex2d_rgba_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012469 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.r"
        "ender.color.blend_tex2d_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012470 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.col"
        "or.blend_tex2d_rgb_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012471 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.r"
        "ender.color.blend_tex2d_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012472 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.col"
        "or.blend_tex2d_rgba_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012473 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.r"
        "ender.color.blend_rbo_rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012474 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.col"
        "or.blend_rbo_rgb565_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012475 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.re"
        "nder.color.blend_rbo_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012476 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.colo"
        "r.blend_rbo_rgb5_a1_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012477 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.r"
        "ender.color.blend_rbo_rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012478 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.col"
        "or.blend_rbo_rgba4_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012479 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.ren"
        "der.color.blend_npot_tex2d_rgb",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012480 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.color"
        ".blend_npot_tex2d_rgb_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012481 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.rend"
        "er.color.blend_npot_tex2d_rgba",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012482 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.color."
        "blend_npot_tex2d_rgba_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012483 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.rend"
        "er.color.blend_npot_rbo_rgb565",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012484 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.color."
        "blend_npot_rbo_rgb565_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012485 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.rend"
        "er.color.blend_npot_rbo_rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012486 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.color."
        "blend_npot_rbo_rgb5_a1_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012487 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.ren"
        "der.color.blend_npot_rbo_rgba4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012488 end";
}

static HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fbo.render.color"
        ".blend_npot_rbo_rgba4_depth_component16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20013TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20013TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20013TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20013TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20013TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012489 end";
}
