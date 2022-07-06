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
#include "../ActsDeqpgles30012TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011984 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011985 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011986 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011987 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011988 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011989 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".binary_operator.equal.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011990 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011991 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011992 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011993 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011994 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011995 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".binary_operator.equal.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011996 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011997 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011998 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011999 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012000 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012001 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".binary_operator.equal.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012002 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012003 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012004 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012005 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012006 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012007 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".binary_operator.equal.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012008 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012009 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012010 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012011 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".binary_operator.equal.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012012 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012013 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012014 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012015 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012016 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012017 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012018 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012019 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012020 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012021 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012022 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012023 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012024 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012025 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012026, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012026 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012026 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012026 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012027, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012027 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012027 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012027 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012028, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012028 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012028 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012028 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012029, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012029 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012029 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012029 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012030, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012030 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012030 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012030 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012031, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012031 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012031 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012031 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012032, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012032 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator"
        ".binary_operator.equal.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012032 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012032 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012033, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012033 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012033 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012033 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012034, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012034 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012034 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012034 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012035, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012035 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012035 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012035 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012036, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012036 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012036 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012036 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012037, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012037 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012037 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012037 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012038, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012038 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012038 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012038 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012039, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012039 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012039 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012039 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012040, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012040 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012040 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012040 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012041, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012041 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012041 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012041 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012042, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012042 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012042 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012042 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012043, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012043 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012043 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012043 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012044, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012044 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012044 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012044 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012045, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012045 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012045 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012045 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012046, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012046 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012046 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012046 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012047, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012047 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012047 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012047 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012048, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012048 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012048 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012048 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012049, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012049 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012049 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012049 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012050 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012051 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012052 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.bi"
        "nary_operator.equal.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012053 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator."
        "binary_operator.equal.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012054 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.b"
        "inary_operator.equal.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012055 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operat"
        "or.binary_operator.equal.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012056 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.binary_operator.equal.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012057 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operat"
        "or.binary_operator.equal.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012058 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.binary_operator.equal.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012059 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operat"
        "or.binary_operator.equal.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012060 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.binary_operator.equal.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012061 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operat"
        "or.binary_operator.equal.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012062 end";
}

static HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_012063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operato"
        "r.binary_operator.equal.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_012063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_012063 end";
}
