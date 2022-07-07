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

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_xyxx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003211 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_zzwz_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003212 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003213, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003213 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_zzwz_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003213 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003213 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003214, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003214 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec4_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003214 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003214 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003215, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003215 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003215 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003215 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003216, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003216 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec4_q_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003216 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003216 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003217, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003217 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_q_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003217 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003217 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003218, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003218 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_qs_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003218 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003218 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003219, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003219 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qs_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003219 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003219 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003220, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003220 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_qp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003220 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003220 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003221, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003221 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003221 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003221 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003222, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003222 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_qqq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003222 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003222 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003223, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003223 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qqq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003223 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003223 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_ttq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003224 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_ttq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003225 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_qpt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003226 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qpt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003227 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_stpq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003228 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_stpq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003229 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qpts_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003230 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_qpts_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003231 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_ssss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003232 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_ssss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003233 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_tttt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003234 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_tttt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003235 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qqqq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003236 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_qqqq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003237 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qppq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003238 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_qppq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003239 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_qqqt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003240 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_qqqt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003241 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_stss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003242 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_stss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003243 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_ppqp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003244 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_ppqp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003245 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec4_r_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003246 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_r_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003247 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_ivec4_a_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003248 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_a_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003249 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_ar_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003250 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_ar_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003251 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_ab_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003252 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_ab_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003253 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_aaa_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003254 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_aaa_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003255 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_gga_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003256 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_gga_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003257 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_ivec4_abg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003258 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_abg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003259 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_rgba_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003260 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_rgba_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003261 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_abgr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003262 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_abgr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003263 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_rrrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003264 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_rrrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003265 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_gggg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003266 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_gggg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003267 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_aaaa_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003268 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_aaaa_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003269 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_abba_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003270 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_abba_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003271 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_aaag_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003272 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_aaag_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003273 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_rgrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003274 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_rgrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003275 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_ivec4_bbab_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003276 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_ivec4_bbab_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003277 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_bvec2_x_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003278 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec2_x_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003279 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec2_xx_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003280 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec2_xx_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003281 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec2_xy_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003282 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec2_xy_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003283 end";
}
