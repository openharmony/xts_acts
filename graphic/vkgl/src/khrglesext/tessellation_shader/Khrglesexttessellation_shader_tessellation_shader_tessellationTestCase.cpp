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

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000174, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000174 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.tessellation_shader.tessellation_shader_te"
        "ssellation.gl_InvocationID_PatchVerticesIn_PrimitiveID",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000174 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000174 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000175, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000175 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.tessellation_shader.tess"
        "ellation_shader_tessellation.TCS_TES",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000175 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000175 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000176, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000176 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.tessellation_shader.te"
        "ssellation_shader_tessellation.TES",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000176 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000176 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000177, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000177 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.tessellation_shader.tessellati"
        "on_shader_tessellation.input_patch_discard",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000177 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000177 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000178, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000178 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.tessellation_shader.tessellatio"
        "n_shader_tessellation.max_in_out_attributes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000178 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000178 end";
}
