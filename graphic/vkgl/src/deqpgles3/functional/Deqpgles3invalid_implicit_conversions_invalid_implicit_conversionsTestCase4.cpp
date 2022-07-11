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

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uvec2_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005450 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_uvec2_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005451 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005452 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005453 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uvec3_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005454 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_uvec3_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005455 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005456 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005457 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uvec4_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005458 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_uvec4_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005459 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec3_uvec4_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005460 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec3_uvec4_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005461 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec4_uint_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005462 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uint_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005463 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_vec4_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005464 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005465 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uvec2_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005466 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_uvec2_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005467 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005468 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005469 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uvec3_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005470 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_uvec3_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005471 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005472 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005473 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uvec4_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005474 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_uvec4_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005475 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_vec4_uvec4_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005476 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_vec4_uvec4_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005477 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi"
        "ons.invalid_implicit_conversions.mul_int_uint_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005478 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_int_uint_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005479 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_int_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005480 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005481, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005481 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005481 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005481 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005482, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005482 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_int_uvec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005482 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005482 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005483, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005483 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uvec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005483 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005483 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005484, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005484 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005484 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005484 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005485, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005485 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_int_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005485 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005485 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_int_uvec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005486 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uvec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005487 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005488 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_int_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005489 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio"
        "ns.invalid_implicit_conversions.mul_int_uvec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005490 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uvec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005491 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_int_uvec4_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005492 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_int_uvec4_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005493 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_ivec2_uint_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005494 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uint_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005495 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_ivec2_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005496 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005497 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uvec2_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005498 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec2_uvec2_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005499 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005500 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec2_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005501 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uvec3_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005502 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec2_uvec3_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005503 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005504 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec2_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005505 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uvec4_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005506 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec2_uvec4_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005507 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec2_uvec4_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005508 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec2_uvec4_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005509 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_ivec3_uint_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005510 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uint_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005511 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion"
        "s.invalid_implicit_conversions.mul_ivec3_uint_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005512 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uint_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005513 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uvec2_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005514 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec3_uvec2_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005515 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uvec2_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005516 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec3_uvec2_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005517 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uvec3_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005518 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec3_uvec3_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005519 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uvec3_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005520 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions."
        "invalid_implicit_conversions.mul_ivec3_uvec3_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005521 end";
}

static HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions"
        ".invalid_implicit_conversions.mul_ivec3_uvec4_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30006TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30006TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30006TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30006TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30006TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005522 end";
}
