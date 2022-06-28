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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_trunc_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003504 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_trunc_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003505 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_trunc_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003506 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_round_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003507 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_round_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003508 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_round_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003509 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_round_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003510 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_round_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003511 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_round_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003512 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_round_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003513 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_round_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003514 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_ceil_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003515 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_ceil_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003516 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_ceil_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003517 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_ceil_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003518 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_ceil_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003519 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_ceil_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003520 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_ceil_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003521 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_ceil_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003522 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003523, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003523 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_mod_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003523 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003523 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003524, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003524 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_mod_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003524 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003524 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003525, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003525 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_mod_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003525 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003525 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003526, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003526 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_mod_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003526 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003526 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003527, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003527 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_mod_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003527 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003527 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003528, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003528 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_mod_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003528 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003528 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003529, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003529 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_mod_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003529 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003529 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003530, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003530 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_mod_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003530 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003530 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003531, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003531 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_mod_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003531 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003531 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_mod_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003532 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_mod_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003533 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_mod_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003534 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_mod_vec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003535 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_mod_vec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003536 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_min_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003537 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_min_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003538 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003539, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003539 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_min_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003539 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003539 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003540, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003540 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_min_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003540 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003540 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003541, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003541 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_min_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003541 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003541 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003542, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003542 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_min_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003542 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003542 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003543, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003543 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_min_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003543 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003543 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_min_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003544 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_min_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003545 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_min_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003546 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_min_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003547 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_min_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003548 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_min_vec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003549 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_min_vec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003550 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_max_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003551 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_max_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003552 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_max_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003553 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_max_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003554 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_max_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003555 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_max_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003556 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_max_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003557 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_max_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003558 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_max_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003559 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_max_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003560 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expr"
        "essions.array_max_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003561 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_max_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003562 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_max_vec4_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003563 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_max_vec4_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003564 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_clamp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003565 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003566, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003566 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_express"
        "ions.array_clamp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003566 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003566 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_clamp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003567 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_clamp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003568 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_clamp_vec2_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003569 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressio"
        "ns.array_clamp_vec2_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003570 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_clamp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003571 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_clamp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003572 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressi"
        "ons.array_clamp_vec3_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003573 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expressio"
        "ns.array_clamp_vec3_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003574 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expre"
        "ssions.array_clamp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003575 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003576, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003576 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.constant_expres"
        "sions.array_clamp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003576 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003576 end";
}
