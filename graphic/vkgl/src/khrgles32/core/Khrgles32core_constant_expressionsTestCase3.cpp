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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_ceil_vec2_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000544 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_ceil_vec2_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000545 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_ceil_vec2_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000546 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_ceil_vec3_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000547 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_ceil_vec3_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000548 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_ceil_vec3_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000549 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_ceil_vec4_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000550 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_ceil_vec4_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000551 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_ceil_vec4_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000552 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000553 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_mod_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000554 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_mod_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000555 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_vec2_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000556 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_mod_vec2_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000557 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_vec2_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000558 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_mod_vec2_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000559 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_mod_vec2_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000560 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_mod_vec2_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000561 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_vec3_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000562 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_mod_vec3_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000563 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_vec3_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000564 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_mod_vec3_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000565 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000566, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000566 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_mod_vec3_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000566 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000566 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_mod_vec3_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000567 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_vec4_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000568 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_mod_vec4_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000569 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_mod_vec4_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000570 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_mod_vec4_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000571 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_mod_vec4_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000572 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_mod_vec4_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000573 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000574 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_min_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000575 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000576, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000576 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_min_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000576 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000576 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000577, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000577 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_vec2_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000577 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000577 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000578, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000578 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_min_vec2_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000578 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000578 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000579, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000579 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_vec2_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000579 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000579 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000580, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000580 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_min_vec2_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000580 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000580 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000581, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000581 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_min_vec2_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000581 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000581 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000582, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000582 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_min_vec2_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000582 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000582 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000583, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000583 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_vec3_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000583 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000583 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000584, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000584 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_min_vec3_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000584 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000584 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000585, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000585 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_vec3_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000585 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000585 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000586, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000586 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_min_vec3_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000586 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000586 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000587, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000587 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_min_vec3_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000587 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000587 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000588, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000588 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_min_vec3_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000588 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000588 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000589, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000589 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_vec4_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000589 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000589 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_min_vec4_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000590 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000591, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000591 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_min_vec4_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000591 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000591 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000592, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000592 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_min_vec4_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000592 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000592 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000593, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000593 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_min_vec4_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000593 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000593 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000594, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000594 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_min_vec4_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000594 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000594 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000595, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000595 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000595 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000595 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000596, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000596 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_max_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000596 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000596 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000597, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000597 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_max_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000597 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000597 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000598, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000598 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_vec2_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000598 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000598 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000599, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000599 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_max_vec2_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000599 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000599 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000600, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000600 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_vec2_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000600 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000600 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000601, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000601 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_max_vec2_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000601 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000601 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000602, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000602 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_max_vec2_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000602 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000602 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000603, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000603 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_max_vec2_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000603 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000603 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000604, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000604 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_vec3_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000604 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000604 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000605, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000605 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_max_vec3_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000605 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000605 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000606, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000606 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_vec3_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000606 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000606 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000607, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000607 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_max_vec3_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000607 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000607 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000608, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000608 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_max_vec3_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000608 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000608 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000609, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000609 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_max_vec3_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000609 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000609 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000610, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000610 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_vec4_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000610 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000610 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000611, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000611 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_express"
        "ions.basic_max_vec4_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000611 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000611 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000612, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000612 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expre"
        "ssions.basic_max_vec4_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000612 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000612 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000613, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000613 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_max_vec4_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000613 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000613 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000614, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000614 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expression"
        "s.basic_max_vec4_float_tess_control",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000614 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000614 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000615, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000615 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expressi"
        "ons.basic_max_vec4_float_tess_eval",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000615 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000615 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000616, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000616 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.constant_expres"
        "sions.basic_clamp_float_geometry",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000616 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000616 end";
}