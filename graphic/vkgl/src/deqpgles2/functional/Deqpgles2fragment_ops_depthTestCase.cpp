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
#include "../ActsDeqpgles20012TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fra"
        "gment_ops.depth.cmp_always",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011001 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fra"
        "gment_ops.depth.cmp_never",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011002 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fra"
        "gment_ops.depth.cmp_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011003 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.depth.cmp_not_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011004 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragm"
        "ent_ops.depth.cmp_less_than",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011005 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragmen"
        "t_ops.depth.cmp_less_or_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011006 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragme"
        "nt_ops.depth.cmp_greater_than",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011007 end";
}

static HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_011008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.fragment"
        "_ops.depth.cmp_greater_or_equal",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20012TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20012TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20012TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20012TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20012TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_011008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_011008 end";
}
