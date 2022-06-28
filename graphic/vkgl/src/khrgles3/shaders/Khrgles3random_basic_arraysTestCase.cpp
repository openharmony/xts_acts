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
#include "../ActsKhrgles30003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002203, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002203 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002203 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002203 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002204, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002204 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002204 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002204 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002205, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002205 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002205 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002205 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002206, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002206 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002206 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002206 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002207, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002207 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002207 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002207 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002208, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002208 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002208 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002208 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002209, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002209 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002209 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002209 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002210, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002210 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002210 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002210 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002211 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_"
        "block.random.basic_arrays.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002212 end";
}
