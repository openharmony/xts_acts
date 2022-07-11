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

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rgb32i.0_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003305 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rgb32i.1_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003306 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rgb32i.16_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003307 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rgb32i.1_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003308 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rgb32i.16_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003309 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rgb32i.16_16_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003310 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rgb32i.1_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003311 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rgb32i.16_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003312 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rgb32i.16_16_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003313 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rgb32i.16_16_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003314 end";
}
