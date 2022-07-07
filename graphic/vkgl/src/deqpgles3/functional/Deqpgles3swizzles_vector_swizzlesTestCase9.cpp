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

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_bvec4_s_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003430 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_s_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003431 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003432 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_bvec4_q_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003432 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003432 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003433 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_q_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003433 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003433 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003434 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_qs_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003434 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003434 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003435 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qs_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003435 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003435 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003436 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_qp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003436 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003436 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003437 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_qqq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003438 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qqq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003439 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_ttq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003440 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_ttq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003441 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_qpt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003442 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qpt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003443 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_stpq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003444 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_stpq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003445 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qpts_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003446 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_qpts_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003447 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_ssss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003448 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_ssss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003449 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_tttt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003450 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_tttt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003451 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qqqq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003452 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_qqqq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003453 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qppq_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003454 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_qppq_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003455 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_qqqt_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003456 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_qqqt_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003457 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_stss_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003458 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_stss_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003459 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_ppqp_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003460 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_ppqp_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003461 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_bvec4_r_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003462 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_r_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003463 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles"
        ".vector_swizzles.mediump_bvec4_a_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003464 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_a_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003465 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_ar_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003466 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_ar_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003467 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_ab_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003468 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_ab_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003469 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_aaa_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003470 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_aaa_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003471 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_gga_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003472 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_gga_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003473 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles."
        "vector_swizzles.mediump_bvec4_abg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003474 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_abg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003475 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_rgba_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003476 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_rgba_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003477 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_abgr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003478 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_abgr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003479 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_rrrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003480 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_rrrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003481 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_gggg_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003482 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_gggg_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003483 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_aaaa_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003484 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_aaaa_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003485 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_abba_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003486 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_abba_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003487 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_aaag_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003488 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_aaag_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003489 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_rgrr_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003490 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_rgrr_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003491 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.v"
        "ector_swizzles.mediump_bvec4_bbab_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003492 end";
}

static HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_003493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.swizzles.ve"
        "ctor_swizzles.mediump_bvec4_bbab_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003493 end";
}
