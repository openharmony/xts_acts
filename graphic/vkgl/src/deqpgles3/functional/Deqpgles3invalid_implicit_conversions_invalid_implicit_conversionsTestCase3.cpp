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
#include "../ActsDeqpgles30006TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005377, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005377 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_ivec3_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005377 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005377 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005378 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_ivec4_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005378 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005378 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005379 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_ivec4_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005379 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005379 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005380, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005380 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_ivec4_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005380 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005380 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005381, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005381 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_ivec4_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005381 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005381 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005382, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005382 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec3_int_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005382 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005382 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005383, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005383 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_int_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005383 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005383 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005384, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005384 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi"
        "ons.invalid_implicit_conversions.mul_vec3_int_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005384 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005384 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005385, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005385 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec3_int_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005385 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005385 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005386, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005386 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_ivec2_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005386 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005386 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005387, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005387 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_ivec2_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005387 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005387 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005388, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005388 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_ivec2_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005388 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005388 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005389, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005389 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_ivec2_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005389 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005389 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005390, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005390 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_ivec3_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005390 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005390 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005391, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005391 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_ivec3_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005391 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005391 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005392, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005392 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_ivec3_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005392 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005392 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005393, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005393 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_ivec3_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005393 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005393 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005394, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005394 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_ivec4_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005394 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005394 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005395, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005395 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_ivec4_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005395 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005395 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_ivec4_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005396 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_ivec4_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005397 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec4_int_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005398 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_int_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005399 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi"
        "ons.invalid_implicit_conversions.mul_vec4_int_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005400 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec4_int_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005401 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_ivec2_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005402 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_ivec2_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005403 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_ivec2_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005404 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_ivec2_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005405 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_ivec3_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005406 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_ivec3_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005407 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_ivec3_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005408 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_ivec3_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005409 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_ivec4_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005410 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_ivec4_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005411 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_ivec4_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005412 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_ivec4_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005413 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_float_uint_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005414 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uint_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005415 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_float_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005416 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005417 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uvec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005418 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_float_uvec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005419 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005420 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_float_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005421 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uvec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005422 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_float_uvec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005423 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005424 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_float_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005425 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uvec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005426 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_float_uvec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005427 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_float_uvec4_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005428 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_float_uvec4_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005429 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec2_uint_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005430 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uint_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005431 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005432 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec2_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005432 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005432 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005433 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005433 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005433 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005434 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uvec2_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005434 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005434 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005435 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_uvec2_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005435 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005435 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005436 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005436 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005436 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005437 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uvec3_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005438 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_uvec3_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005439 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005440 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005441 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uvec4_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005442 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_uvec4_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005443 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec2_uvec4_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005444 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec2_uvec4_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005445 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec3_uint_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005446 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uint_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005447 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec3_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005448 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005449 end";
}
