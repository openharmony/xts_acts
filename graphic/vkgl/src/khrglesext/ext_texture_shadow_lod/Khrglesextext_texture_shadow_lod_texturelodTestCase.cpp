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

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.ext_texture_shadow_lod.t"
        "exturelod.sampler2darrayshadow_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000328 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.ext_texture_shadow_lod.te"
        "xturelod.sampler2darrayshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000329 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.ext_texture_shadow_lod."
        "texturelod.samplercubeshadow_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000330 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.ext_texture_shadow_lod.t"
        "exturelod.samplercubeshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000331 end";
}

static HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLESEXT.ext_texture_shadow_lod.tex"
        "turelod.samplercubearrayshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrglesext0001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrglesext0001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrglesext0001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrglesext0001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrglesext0001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000332 end";
}
