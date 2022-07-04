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

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010355, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010355 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_nearest_clamp_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010355 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010355 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010356, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010356 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering"
        ".2d.nearest_nearest_clamp_rgba8888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010356 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010356 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010357, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010357 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.nearest_nearest_clamp_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010357 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010357 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_nearest_clamp_rgb888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010358 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_nearest_clamp_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010359 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010360, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010360 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering"
        ".2d.nearest_nearest_clamp_rgba4444_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010360 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010360 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010361, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010361 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.nearest_nearest_clamp_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010361 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010361 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010362, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010362 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filter"
        "ing.2d.nearest_nearest_clamp_l8_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010362 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010362 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010363, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010363 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering"
        ".2d.nearest_nearest_repeat_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010363 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010363 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010364, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010364 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_nearest_repeat_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010364 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010364 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010365, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010365 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering"
        ".2d.nearest_nearest_repeat_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010365 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010365 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010366, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010366 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filter"
        "ing.2d.nearest_nearest_repeat_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010366 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010366 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010367, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010367 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering"
        ".2d.nearest_nearest_mirror_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010367 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010367 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010368, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010368 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_nearest_mirror_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010368 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010368 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010369, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010369 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering"
        ".2d.nearest_nearest_mirror_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010369 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010369 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010370, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010370 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filter"
        "ing.2d.nearest_nearest_mirror_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010370 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010370 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010371, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010371 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_clamp_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010371 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010371 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010372, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010372 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_clamp_rgba8888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010372 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010372 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010373, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010373 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.nearest_linear_clamp_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010373 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010373 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010374, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010374 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.nearest_linear_clamp_rgb888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010374 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010374 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010375, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010375 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_clamp_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010375 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010375 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010376, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010376 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_clamp_rgba4444_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010376 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010376 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.nearest_linear_clamp_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010377 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.nearest_linear_clamp_l8_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010378 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_repeat_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010379 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.nearest_linear_repeat_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010380 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_repeat_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010381 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.nearest_linear_repeat_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010382 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_mirror_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010383 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.nearest_linear_mirror_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010384 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.nearest_linear_mirror_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010385 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.nearest_linear_mirror_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010386 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_clamp_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010387 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_clamp_rgba8888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010388 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_nearest_clamp_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010389 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_nearest_clamp_rgb888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010390 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_clamp_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010391 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_clamp_rgba4444_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010392 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_nearest_clamp_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010393 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_nearest_clamp_l8_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010394 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_repeat_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010395 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_nearest_repeat_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010396 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_repeat_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010397 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_nearest_repeat_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010398 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_mirror_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010399 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_nearest_mirror_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010400 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_nearest_mirror_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010401 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_nearest_mirror_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010402 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_linear_clamp_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010403 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_linear_clamp_rgba8888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010404 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filter"
        "ing.2d.linear_linear_clamp_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010405 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_linear_clamp_rgb888_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010406 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_linear_clamp_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010407 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_linear_clamp_rgba4444_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010408 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filt"
        "ering.2d.linear_linear_clamp_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010409 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_linear_clamp_l8_npot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010410 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_linear_repeat_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010411 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_linear_repeat_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010412 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_linear_repeat_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010413 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_linear_repeat_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010414 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_linear_mirror_rgba8888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010415 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filteri"
        "ng.2d.linear_linear_mirror_rgb888_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010416 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filterin"
        "g.2d.linear_linear_mirror_rgba4444_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010417 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filte"
        "ring.2d.linear_linear_mirror_l8_pot",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010418 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d.n"
        "earest_mipmap_nearest_nearest_clamp_rgba8888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010419 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d.n"
        "earest_mipmap_nearest_nearest_repeat_rgba8888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010420 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d."
        "nearest_mipmap_nearest_nearest_repeat_rgb888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010421 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d.n"
        "earest_mipmap_nearest_nearest_repeat_rgba4444",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010422 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2"
        "d.nearest_mipmap_nearest_nearest_repeat_l8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010423 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d.n"
        "earest_mipmap_nearest_nearest_mirror_rgba8888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010424 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d."
        "nearest_mipmap_nearest_linear_clamp_rgba8888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010425 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d.n"
        "earest_mipmap_nearest_linear_repeat_rgba8888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010426 end";
}

static HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.texture.filtering.2d.n"
        "earest_mipmap_nearest_linear_mirror_rgba8888",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010427 end";
}
