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
#include "../ActsKhrgles310004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.rg8i.0_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003145 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.rg8i.1_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003146 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg8i.16_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003147 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.rg8i.1_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003148 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg8i.16_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003149 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg8i.16_16_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003150 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.rg8i.1_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003151 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003152, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003152 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg8i.16_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003152 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003152 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003153, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003153 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg8i.16_16_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003153 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003153 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003154, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003154 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg8i.16_16_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003154 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003154 end";
}
