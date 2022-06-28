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
#include "../ActsKhrgles30002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001597, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001597 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001597 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001597 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001598, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001598 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001598 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001598 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001599, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001599 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001599 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001599 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001600, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001600 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001600 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001600 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001601, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001601 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001601 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001601 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001602, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001602 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001602 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001602 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001603, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001603 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001603 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001603 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001604, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001604 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001604 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001604 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001605, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001605 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001605 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001605 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001606, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001606 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001606 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001606 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001607, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001607 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001607 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001607 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001608, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001608 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001608 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001608 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001609, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001609 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block."
        "single_basic_type.packed.lowp_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001609 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001609 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001610, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001610 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001610 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001610 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001611, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001611 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001611 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001611 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001612, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001612 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001612 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001612 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001613 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001614 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001615 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001616 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001617, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001617 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001617 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001617 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001618, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001618 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001618 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001618 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001619, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001619 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001619 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001619 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001620, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001620 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001620 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001620 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001621, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001621 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001621 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001621 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001622, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001622 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001622 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001622 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001623 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001624 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001625 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001626 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001627 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001628 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001629 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001630 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001631 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001632 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_bloc"
        "k.single_basic_type.packed.bool",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001633 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block"
        ".single_basic_type.packed.bvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001634 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block"
        ".single_basic_type.packed.bvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001635 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block"
        ".single_basic_type.packed.bvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001636 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001637 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001638 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001639 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.packed.row_major_lowp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001640 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.row_major_mediump_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001641 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.packed.row_major_highp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001642 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.column_major_lowp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001643 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_ba"
        "sic_type.packed.column_major_mediump_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001644 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.packed.column_major_highp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001645 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001646 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001647 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001648 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.packed.row_major_lowp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001649 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.row_major_mediump_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001650 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.packed.row_major_highp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001651 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.column_major_lowp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001652 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_ba"
        "sic_type.packed.column_major_mediump_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001653 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.packed.column_major_highp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001654 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.lowp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001655 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.mediump_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001656 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.packed.highp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001657 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.packed.row_major_lowp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001658 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.row_major_mediump_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001659 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.packed.row_major_highp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001660 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.column_major_lowp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001661 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_ba"
        "sic_type.packed.column_major_mediump_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001662 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.packed.column_major_highp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001663 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.lowp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001664 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.packed.mediump_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001665 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.packed.highp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001666 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.row_major_lowp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001667 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.packed.row_major_mediump_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001668 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.packed.row_major_highp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001669 end";
}
