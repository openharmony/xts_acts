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

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_xx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003065 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_xy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003066 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_xy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003067 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_yx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003068 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_yx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003069 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_yxy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003070 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_yxy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003071 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_xyxx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003072 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_xyxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003073 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_yyyy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003074 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_yyyy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003075 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec2_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003076 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003077 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_ss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003078 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_ss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003079 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_st_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003080 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_st_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003081 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_ts_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003082 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_ts_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003083 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_tst_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003084 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_tst_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003085 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_stss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003086 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_stss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003087 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_tttt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003088 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_tttt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003089 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec2_r_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003090 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_r_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003091 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_rr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003092 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_rr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003093 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_rg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003094 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_rg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003095 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_gr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003096 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_gr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003097 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec2_grg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003098 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_grg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003099 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_rgrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003100 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_rgrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003101 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec2_gggg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003102 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec2_gggg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003103 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_x_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003104 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_x_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003105 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_z_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003106 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_z_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003107 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003108 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003109 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003110 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003111 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xyz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003112 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xyz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003113 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zyx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003114 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zyx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003115 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xxx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003116 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003117 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zzz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003118 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zzz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003119 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_zzy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003120 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zzy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003121 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_yxy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003122 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_yxy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003123 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_xzx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003124 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xzx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003125 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_xyyx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003126 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec3_xyyx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003127 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_zzzz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003128 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec3_zzzz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003129 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003130 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003131 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003132, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003132 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec3_p_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003132 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003132 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003133, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003133 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_p_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003133 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003133 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003134, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003134 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_sp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003134 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003134 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_sp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003135 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec3_pp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003136 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec3_pp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003137 end";
}
