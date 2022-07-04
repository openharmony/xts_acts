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
#include "../ActsKhrgles320002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.ext_texture_shadow_lod"
        ".texturelod.sampler2darrayshadow_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001140 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.ext_texture_shadow_lod."
        "texturelod.sampler2darrayshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001141 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.ext_texture_shadow_lo"
        "d.texturelod.samplercubeshadow_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001142 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.ext_texture_shadow_lod"
        ".texturelod.samplercubeshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001143 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.ext_texture_shadow_lod.t"
        "exturelod.samplercubearrayshadow_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001144 end";
}
