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
#include "../ActsKhrgles310003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstora"
        "gemodes.teximage3d.r8.0_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002995 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstora"
        "gemodes.teximage3d.r8.1_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002996 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.r8.16_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002997 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstora"
        "gemodes.teximage3d.r8.1_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002998 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.r8.16_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002999 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.r8.16_16_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003000 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstora"
        "gemodes.teximage3d.r8.1_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003001 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.r8.16_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003002 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.r8.16_16_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003003 end";
}

static HWTEST_F(ActsKhrgles310003TestSuite, TestCase_003004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorag"
        "emodes.teximage3d.r8.16_16_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003004 end";
}
