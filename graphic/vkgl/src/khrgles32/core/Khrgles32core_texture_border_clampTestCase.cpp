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
#include "../ActsKhrgles320001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.border_color_errors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000271 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.texparameteri_errors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000272 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border"
        "_clamp.gettexparameteri_errors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000273 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_clamp.s"
        "amplerparameteri_non_gen_sampler_error",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000274 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_clam"
        "p.samplerparameteri_with_wrong_pname",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000275 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_cl"
        "amp.samplerparameteri_border_color",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000276 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bo"
        "rder_clamp.Texture2DRGBA32F",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000277 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture2DR32I",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000278 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture2DR32UI",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000279 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture2DRGBA8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000280 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture2DDC32F",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000281 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture2DDC16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000282 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture2DCompressed",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000283 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_borde"
        "r_clamp.Texture2DArrayRGBA32F",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000284 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bor"
        "der_clamp.Texture2DArrayR32I",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000285 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture2DArrayR32UI",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000286 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture2DArrayRGBA8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000287 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border"
        "_clamp.Texture2DArrayCompressed",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000288 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bo"
        "rder_clamp.Texture3DRGBA32F",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000289 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture3DR32I",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000290 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture3DR32UI",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000291 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_b"
        "order_clamp.Texture3DRGBA8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000292 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_borde"
        "r_clamp.Texture2DRGBA32FLinear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000293 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture2DRGBA8Linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000294 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture2DDC32FLinear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000295 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture2DDC16Linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000296 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_"
        "clamp.Texture2DCompressedLinear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000297 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_c"
        "lamp.Texture2DArrayRGBA32FLinear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000298 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_"
        "clamp.Texture2DArrayRGBA8Linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000299 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_border_cl"
        "amp.Texture2DArrayCompressedLinear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000300 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_borde"
        "r_clamp.Texture3DRGBA32FLinear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000301 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.texture_bord"
        "er_clamp.Texture3DRGBA8Linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000302 end";
}
