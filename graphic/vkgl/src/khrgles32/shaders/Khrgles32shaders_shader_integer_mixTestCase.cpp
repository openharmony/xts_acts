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
#include "../ActsKhrgles320001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.sha"
        "der_integer_mix.define",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000007 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.shader_int"
        "eger_mix.prototypes-extension",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000008 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.shade"
        "r_integer_mix.prototypes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000009 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.shader_in"
        "teger_mix.prototypes-negative",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000010 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.shad"
        "er_integer_mix.mix-ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000011 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.shad"
        "er_integer_mix.mix-uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000012 end";
}

static HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES32.shaders.shad"
        "er_integer_mix.mix-bvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles320001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles320001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles320001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles320001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles320001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000013 end";
}
