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

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.0_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003405 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.1_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003406 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.16_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003407 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.1_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003408 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.16_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003409 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemod"
        "es.teximage3d.rgb10a2ui.16_16_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003410 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.1_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003411 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemo"
        "des.teximage3d.rgb10a2ui.16_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003412 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemod"
        "es.teximage3d.rgb10a2ui.16_16_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003413 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragemod"
        "es.teximage3d.rgb10a2ui.16_16_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003414 end";
}
