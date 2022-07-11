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
#include "../ActsDeqpgles30008TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007286 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007287 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007288 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007289 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007290 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007291 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.plus.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007292 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007293 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007294 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007295 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007296 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007297 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.plus.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007298 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007299 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007300 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007301 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007302 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007303 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.plus.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007304 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007305 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007306 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007307 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007308 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007309 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.plus.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007310 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007311 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007312 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007313 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.plus.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007314 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007315 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007316 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007317 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007318 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007319 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007320 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007321 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007322 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007323 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007324 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007325 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007326 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007327 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007328 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007329 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007330 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007331 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007332 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007333 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.unary_operator.plus.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007334 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007335 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007336 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007337 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007338 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007339, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007339 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007339 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007339 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007340, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007340 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007340 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007340 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007341, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007341 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007341 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007341 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007342, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007342 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007342 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007342 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007343, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007343 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007343 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007343 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007344, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007344 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007344 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007344 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007345, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007345 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007345 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007345 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007346, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007346 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007346 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007346 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007347, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007347 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007347 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007347 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007348, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007348 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007348 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007348 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007349, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007349 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007349 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007349 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007350, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007350 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007350 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007350 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007351, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007351 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007351 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007351 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007352, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007352 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007352 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007352 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007353, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007353 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007353 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007353 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007354, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007354 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007354 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007354 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007355, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007355 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.u"
        "nary_operator.plus.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007355 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007355 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007356, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007356 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".unary_operator.plus.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007356 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007356 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007357, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007357 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "unary_operator.plus.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007357 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007357 end";
}
