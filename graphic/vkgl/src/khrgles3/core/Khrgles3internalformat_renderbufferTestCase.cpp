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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.internalf"
        "ormat.renderbuffer.rgba8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003701 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.internal"
        "format.renderbuffer.rgb8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003702 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.internalfo"
        "rmat.renderbuffer.rgb5_a1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003703 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.internalform"
        "at.renderbuffer.srgb8_alpha8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003704 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.internalformat."
        "renderbuffer.depth_component32f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003705 end";
}

static HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.core.internalformat."
        "renderbuffer.depth32f_stencil8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30004TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30004TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003706 end";
}
