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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.Functio"
        "nalTests.multisampled_fbo_to_singlesampled_fbo_blit",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000053 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.Funct"
        "ionalTests.blitting_multisampled_depth_attachment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000054 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.Functi"
        "onalTests.blitting_multisampled_integer_attachment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000055 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.Functi"
        "onalTests.blitting_to_multisampled_fbo_is_forbidden",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000056 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.FunctionalTests.verif"
        "y_sample_masking_for_non_integer_color_renderable_internalformats",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000057 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.Fu"
        "nctionalTests.texture_size_in_fragment_shaders",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000058 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.texture_storage_multisample.F"
        "unctionalTests.texture_size_in_vertex_shaders",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000059 end";
}
