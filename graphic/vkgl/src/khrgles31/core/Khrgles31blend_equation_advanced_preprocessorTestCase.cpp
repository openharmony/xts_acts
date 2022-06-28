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
#include "../ActsKhrgles310002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equati"
        "on_advanced.preprocessor.none",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001726 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation"
        "_advanced.preprocessor.require",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001727 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equatio"
        "n_advanced.preprocessor.enable",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001728 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equati"
        "on_advanced.preprocessor.warn",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001729 end";
}

static HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.blend_equation"
        "_advanced.preprocessor.disable",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001730 end";
}
