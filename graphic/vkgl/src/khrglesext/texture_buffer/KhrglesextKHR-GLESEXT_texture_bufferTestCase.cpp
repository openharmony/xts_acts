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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.textu"
        "re_buffer_operations_buffer_load",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000274 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.text"
        "ure_buffer_operations_cpu_writes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000275 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.texture_b"
        "uffer_operations_framebuffer_readback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000276 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.texture_"
        "buffer_operations_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000277 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.textu"
        "re_buffer_operations_image_store",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000278 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.textu"
        "re_buffer_operations_ssbo_writes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000279 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffe"
        "r.texture_buffer_max_size",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000280 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.text"
        "ure_buffer_texture_buffer_range",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000281 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.te"
        "xture_buffer_conv_int_to_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000282 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.te"
        "xture_buffer_atomic_functions",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000283 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer"
        ".texture_buffer_parameters",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000284 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buff"
        "er.texture_buffer_errors",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000285 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.texture_buffer"
        "_active_uniform_validation_fragment_shader",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000286 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.texture_buffer"
        "_active_uniform_validation_compute_shader",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000287 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffer.te"
        "xture_buffer_buffer_parameters",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000288 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.texture_buffe"
        "r.texture_buffer_precision",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000289 end";
}
