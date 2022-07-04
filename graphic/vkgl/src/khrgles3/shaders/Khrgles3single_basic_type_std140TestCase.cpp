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

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001718 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001719 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001720 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001721 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001722 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001723 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001724 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001725 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001726 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001727 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001728 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001729 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block."
        "single_basic_type.std140.lowp_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001730 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001731 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001732 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001733 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001734 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001735 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001736 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001737 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001738 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001739 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001740 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001741 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001742 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001743 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001744 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001745 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001746 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001747 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001748 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001749 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001750 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001751 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001752 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001753 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_bloc"
        "k.single_basic_type.std140.bool",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001754 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block"
        ".single_basic_type.std140.bvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001755 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block"
        ".single_basic_type.std140.bvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001756 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block"
        ".single_basic_type.std140.bvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001757 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001758 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001759 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001760 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.std140.row_major_lowp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001761 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001762, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001762 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.row_major_mediump_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001762 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001762 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001763, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001763 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.std140.row_major_highp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001763 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001763 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.column_major_lowp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001764 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_ba"
        "sic_type.std140.column_major_mediump_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001765 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.std140.column_major_highp_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001766 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001767 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001768 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001769 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.std140.row_major_lowp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001770 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.row_major_mediump_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001771 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.std140.row_major_highp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001772 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.column_major_lowp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001773 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_ba"
        "sic_type.std140.column_major_mediump_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001774 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.std140.column_major_highp_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001775 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.lowp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001776 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.mediump_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001777 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.s"
        "ingle_basic_type.std140.highp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001778 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.std140.row_major_lowp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001779 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.row_major_mediump_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001780 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single"
        "_basic_type.std140.row_major_highp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001781 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.column_major_lowp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001782 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_ba"
        "sic_type.std140.column_major_mediump_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001783 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.std140.column_major_highp_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001784 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.lowp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001785 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.sin"
        "gle_basic_type.std140.mediump_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001786 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.si"
        "ngle_basic_type.std140.highp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001787 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.row_major_lowp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001788 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_b"
        "asic_type.std140.row_major_mediump_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001789 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_"
        "basic_type.std140.row_major_highp_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001790 end";
}
