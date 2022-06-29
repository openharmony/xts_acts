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
#include "../ActsDeqpgles20009TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008982 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008983 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008984 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008985 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008986 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008987 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008988 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008989 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008990 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.random.swizzle.fragment.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008991 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008992 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008993 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008994 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008995 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008996 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008997 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008998 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008999 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009000 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009001 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009002 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009003 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009004 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009005 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009006 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009007 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009008 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009009 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009010 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009011 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009012 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009013 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009014 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009015 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009016 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009017 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009018 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009019 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009020 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009021 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009022 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009023 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009024 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009025 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009026, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009026 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009026 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009026 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009027, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009027 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009027 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009027 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009028, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009028 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009028 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009028 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009029, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009029 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009029 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009029 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009030, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009030 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009030 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009030 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009031, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_009031 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.random.swizzle.fragment.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_009031 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_009031 end";
}
