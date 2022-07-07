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
#include "../ActsDeqpgles30003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002846, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002846 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_x_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002846 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002846 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002847, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002847 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_x_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002847 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002847 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002848, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002848 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_xx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002848 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002848 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002849, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002849 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_xx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002849 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002849 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002850, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002850 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_xy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002850 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002850 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002851, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002851 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_xy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002851 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002851 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002852, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002852 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_yx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002852 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002852 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002853, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002853 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_yx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002853 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002853 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002854, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002854 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_yxy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002854 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002854 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002855, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002855 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_yxy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002855 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002855 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002856, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002856 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_xyxx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002856 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002856 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002857, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002857 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_xyxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002857 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002857 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002858, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002858 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_yyyy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002858 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002858 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002859, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002859 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_yyyy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002859 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002859 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002860, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002860 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002860 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002860 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002861, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002861 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002861 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002861 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002862, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002862 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_ss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002862 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002862 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_ss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002863 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_st_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002864 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_st_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002865 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_ts_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002866 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_ts_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002867 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_tst_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002868 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_tst_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002869 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_stss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002870 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_stss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002871 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_tttt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002872 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_tttt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002873 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002874, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002874 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_r_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002874 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002874 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002875, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002875 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_r_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002875 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002875 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002876, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002876 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_rr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002876 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002876 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002877, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002877 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_rr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002877 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002877 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002878, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002878 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_rg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002878 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002878 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002879, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002879 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_rg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002879 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002879 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002880, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002880 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec2_gr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002880 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002880 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002881, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002881 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_gr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002881 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002881 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002882, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002882 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_grg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002882 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002882 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002883, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002883 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_grg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002883 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002883 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002884, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002884 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_rgrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002884 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002884 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002885, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002885 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_rgrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002885 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002885 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002886, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002886 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec2_gggg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002886 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002886 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002887, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002887 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec2_gggg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002887 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002887 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002888, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002888 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_x_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002888 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002888 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002889, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002889 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_x_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002889 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002889 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002890, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002890 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_z_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002890 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002890 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002891, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002891 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_z_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002891 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002891 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002892, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002892 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_xz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002892 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002892 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002893, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002893 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_xz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002893 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002893 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002894, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002894 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_zz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002894 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002894 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002895, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002895 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_zz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002895 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002895 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002896, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002896 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_xyz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002896 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002896 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002897, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002897 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_xyz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002897 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002897 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002898, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002898 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_zyx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002898 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002898 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002899, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002899 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_zyx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002899 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002899 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002900, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002900 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_xxx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002900 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002900 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002901, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002901 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_xxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002901 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002901 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002902, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002902 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_zzz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002902 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002902 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002903, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002903 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_zzz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002903 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002903 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002904, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002904 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_zzy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002904 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002904 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002905, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002905 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_zzy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002905 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002905 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002906, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002906 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_yxy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002906 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002906 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002907, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002907 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_yxy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002907 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002907 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002908, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002908 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_xzx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002908 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002908 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002909, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002909 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_xzx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002909 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002909 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002910, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002910 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_xyyx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002910 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002910 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002911, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002911 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_xyyx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002911 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002911 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002912, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002912 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_zzzz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002912 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002912 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002913, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002913 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_vec3_zzzz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002913 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002913 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002914, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002914 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002914 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002914 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002915, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002915 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002915 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002915 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002916, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002916 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_p_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002916 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002916 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002917, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002917 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_vec3_p_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002917 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002917 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002918, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002918 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_vec3_sp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002918 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002918 end";
}
