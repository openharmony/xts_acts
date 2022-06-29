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

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internal"
        "format.renderbuffer.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001126 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internal"
        "format.renderbuffer.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001127 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalf"
        "ormat.renderbuffer.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001128 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalform"
        "at.renderbuffer.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001129 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalformat."
        "renderbuffer.depth_component32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001130 end";
}

static HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.core.internalformat"
        ".renderbuffer.depth32f_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001131 end";
}
