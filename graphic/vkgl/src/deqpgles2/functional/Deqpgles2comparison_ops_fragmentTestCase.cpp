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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20010TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009082 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009083 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009084 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009085 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009086 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009087 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009088 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009089 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009090 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009091 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009092 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009093 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009094 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009095 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009096 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009097 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009098 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009099 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009100 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009101 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009102 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009103 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009104 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009105 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009106 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009107 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009108 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009109 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009110 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009111 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009112 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009113 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009114 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009115 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009116 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009117 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009118 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009119 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009120 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009121 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009122 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009123 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009124 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009125 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009126 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009127 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009128 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009129 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009130 end";
}

static HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.r"
        "andom.comparison_ops.fragment.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20010TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20010TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20010TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20010TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20010TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009131 end";
}
