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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_v"
        "ertex_tests.basevertex_behavior1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000290 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_v"
        "ertex_tests.basevertex_behavior2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000291 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base"
        "_vertex_tests.AEP_shader_stages",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000292 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_"
        "base_vertex_tests.underflow",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000293 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_"
        "base_vertex_tests.overflow",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000294 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_bas"
        "e_vertex_tests.valid_active_tf",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000295 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_ve"
        "rtex_tests.invalid_count_argument",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000296 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_vertex"
        "_tests.invalid_instancecount_argument",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000297 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_v"
        "ertex_tests.invalid_mode_argument",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000298 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_vert"
        "ex_tests.invalid_primcount_argument",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000299 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_vert"
        "ex_tests.invalid_start_end_arguments",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000300 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.draw_elements_base_v"
        "ertex_tests.invalid_type_argument",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000301 end";
}
