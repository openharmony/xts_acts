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

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variables"
        ".mask.rgba8ui.samples_8.mask_zero",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000264 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000265 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000266 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000267 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000268 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000269 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000270 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000271 end";
}

static HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.sample_variable"
        "s.mask.rgba8ui.samples_8.mask_7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000272 end";
}
