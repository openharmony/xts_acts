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
#include "../ActsDeqpgles30017TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.sub_assign.lowp_mat2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016284 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016285 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.mediump_mat2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016286 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016287 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.sub_assign.highp_mat2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016288 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016289 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat2x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016290 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.lowp_mat2x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016291 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat2x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016292 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.s"
        "ub_assign.mediump_mat2x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016293 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat2x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016294 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.highp_mat2x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016295 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat2x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016296 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.lowp_mat2x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016297 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat2x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016298 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.s"
        "ub_assign.mediump_mat2x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016299 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat2x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016300 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.highp_mat2x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016301 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat3x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016302 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.lowp_mat3x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016303 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat3x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016304 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.s"
        "ub_assign.mediump_mat3x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016305 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat3x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016306 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.highp_mat3x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016307 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.sub_assign.lowp_mat3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016308 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016309 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.mediump_mat3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016310 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016311 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.sub_assign.highp_mat3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016312 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016313 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat3x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016314 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.lowp_mat3x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016315 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat3x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016316 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.s"
        "ub_assign.mediump_mat3x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016317 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat3x4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016318 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.highp_mat3x4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016319 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat4x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016320 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.lowp_mat4x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016321 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat4x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016322 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.s"
        "ub_assign.mediump_mat4x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016323 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat4x2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016324 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.highp_mat4x2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016325 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat4x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016326 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.lowp_mat4x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016327 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat4x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016328 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix.s"
        "ub_assign.mediump_mat4x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016329 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat4x3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016330 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.highp_mat4x3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016331 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.sub_assign.lowp_mat4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016332 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.lowp_mat4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016333 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.mediump_mat4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016334 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix."
        "sub_assign.mediump_mat4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016335 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matri"
        "x.sub_assign.highp_mat4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016336 end";
}

static HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.matrix"
        ".sub_assign.highp_mat4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016337 end";
}
