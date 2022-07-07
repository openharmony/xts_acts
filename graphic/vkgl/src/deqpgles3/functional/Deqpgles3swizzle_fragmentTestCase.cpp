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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30021TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020644 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020645 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020646 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020647 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020648 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020649 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020650 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020651 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020652 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shade"
        "rs.random.swizzle.fragment.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020653 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020654 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020655 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020656 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020657 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020658 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020659 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020660 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020661 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020662 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020663 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.20",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020664 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.21",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020665 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.22",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020666 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.23",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020667 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.24",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020668 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.25",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020669 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.26",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020670 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.27",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020671 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.28",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020672 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.29",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020673 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.30",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020674 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.31",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020675 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.32",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020676 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.33",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020677 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.34",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020678 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.35",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020679 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.36",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020680 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.37",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020681 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.38",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020682 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.39",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020683 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.40",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020684 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.41",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020685 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.42",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020686 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.43",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020687 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.44",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020688 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.45",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020689 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.46",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020690 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.47",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020691 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.48",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020692 end";
}

static HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_020693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shader"
        "s.random.swizzle.fragment.49",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30021TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30021TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30021TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30021TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30021TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_020693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_020693 end";
}
