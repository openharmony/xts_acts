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

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003165, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003165 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.0_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003165 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003165 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003166, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003166 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.1_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003166 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003166 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003167, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003167 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.16_0_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003167 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003167 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003168, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003168 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.1_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003168 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003168 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003169, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003169 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.16_1_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003169 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003169 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003170, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003170 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rg16i.16_16_0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003170 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003170 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003171, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003171 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.1_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003171 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003171 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003172, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003172 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstorage"
        "modes.teximage3d.rg16i.16_1_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003172 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003172 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003173, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003173 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rg16i.16_16_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003173 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003173 end";
}

static HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003174, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003174 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES31.core.pixelstoragem"
        "odes.teximage3d.rg16i.16_16_4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles310004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles310004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles310004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles310004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles310004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003174 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003174 end";
}
