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
#include "../ActsDeqpgles30032TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba32f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031651 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba32f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031652 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba32i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031653 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba32i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031654 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba32ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031655 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba32ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031656 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031657 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031658 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba16i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031659 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba16i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031660 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba16ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031661 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba16ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031662 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rgb16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031663 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rgb16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031664 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rgba8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031665 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rgba8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031666 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rgba8i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031667 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rgba8i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031668 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgba8ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031669 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgba8ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031670 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color.te"
        "x2d_srgb8_alpha8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031671 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color.r"
        "bo_srgb8_alpha8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031672 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgb10_a2_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031673 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgb10_a2_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031674 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color.t"
        "ex2d_rgb10_a2ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031675 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "rbo_rgb10_a2ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031676 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rgba4_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031677 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rgba4_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031678 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color."
        "tex2d_rgb5_a1_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031679 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".rbo_rgb5_a1_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031680 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_rgb8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031681 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_rgb8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031682 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rgb565_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031683 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rgb565_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031684 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color.tex"
        "2d_r11f_g11f_b10f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031685 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color.rb"
        "o_r11f_g11f_b10f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031686 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg32f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031687 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg32f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031688 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg32i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031689 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg32i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031690 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg32ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031691 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg32ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031692 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031693 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031694 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg16i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031695 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg16i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031696 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg16ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031697 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg16ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031698 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_rg8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031699 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_rg8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031700 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_rg8i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031701 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_rg8i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031702 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_rg8ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031703 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_rg8ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031704 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_r32f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031705 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_r32f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031706 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_r32i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031707 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_r32i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031708 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_r32ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031709 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_r32ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031710 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_r16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031711 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_r16f_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031712 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_r16i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031713 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_r16i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031714 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_color"
        ".tex2d_r16ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031715 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.rbo_r16ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031716 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.tex2d_r8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031717 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_co"
        "lor.rbo_r8_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031718 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_r8i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031719 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_r8i_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031720 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_colo"
        "r.tex2d_r8ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031721 end";
}

static HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_031722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.render.recreate_col"
        "or.rbo_r8ui_depth_stencil_rbo_depth24_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30032TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30032TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30032TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30032TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30032TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_031722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_031722 end";
}
