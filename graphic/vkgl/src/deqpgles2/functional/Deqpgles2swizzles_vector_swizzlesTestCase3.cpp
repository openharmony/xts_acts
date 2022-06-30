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
#include "../ActsDeqpgles20002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_xx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001567 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_xy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001568 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_xy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001569 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_yx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001570 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_yx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001571 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_yxy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001572 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_yxy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001573 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_xyxx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001574 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_xyxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001575 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001576, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001576 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_yyyy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001576 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001576 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001577, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001577 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_yyyy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001577 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001577 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001578, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001578 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec2_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001578 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001578 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001579, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001579 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001579 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001579 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001580, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001580 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_ss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001580 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001580 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001581, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001581 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_ss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001581 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001581 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001582, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001582 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_st_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001582 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001582 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001583, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001583 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_st_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001583 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001583 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001584, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001584 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_ts_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001584 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001584 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001585, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001585 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_ts_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001585 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001585 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001586, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001586 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_tst_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001586 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001586 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001587, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001587 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_tst_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001587 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001587 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001588, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001588 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_stss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001588 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001588 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001589, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001589 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_stss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001589 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001589 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_tttt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001590 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001591, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001591 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_tttt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001591 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001591 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001592, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001592 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec2_r_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001592 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001592 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001593, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001593 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_r_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001593 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001593 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001594, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001594 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_rr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001594 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001594 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001595, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001595 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_rr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001595 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001595 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001596, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001596 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_rg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001596 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001596 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001597, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001597 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_rg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001597 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001597 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001598, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001598 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_gr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001598 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001598 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001599, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001599 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_gr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001599 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001599 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001600, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001600 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_grg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001600 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001600 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001601, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001601 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_grg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001601 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001601 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001602, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001602 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_rgrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001602 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001602 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001603, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001603 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_rgrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001603 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001603 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001604, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001604 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_gggg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001604 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001604 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001605, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001605 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_gggg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001605 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001605 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001606, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001606 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_x_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001606 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001606 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001607, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001607 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_x_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001607 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001607 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001608, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001608 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_z_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001608 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001608 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001609, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001609 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_z_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001609 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001609 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001610, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001610 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001610 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001610 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001611, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001611 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001611 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001611 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001612, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001612 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001612 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001612 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001613 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xyz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001614 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xyz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001615 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zyx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001616 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001617, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001617 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zyx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001617 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001617 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001618, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001618 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xxx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001618 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001618 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001619, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001619 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001619 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001619 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001620, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001620 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zzz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001620 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001620 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001621, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001621 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zzz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001621 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001621 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001622, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001622 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zzy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001622 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001622 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001623, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001623 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zzy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001623 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001623 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001624, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001624 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_yxy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001624 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001624 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001625, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001625 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_yxy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001625 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001625 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001626, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001626 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xzx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001626 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001626 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001627, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001627 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xzx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001627 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001627 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xyyx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001628 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec3_xyyx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001629 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zzzz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001630 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec3_zzzz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001631 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001632 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001633 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_p_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001634 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_p_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001635 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_sp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001636 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_sp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001637 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_pp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001638 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_pp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001639 end";
}
