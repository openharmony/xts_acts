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
#include "../ActsDeqpgles20001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".constants.float_input_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000649 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "constants.float_input_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000650 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000651, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000651 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "constants.float_uniform_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000651 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000651 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000652, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000652 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.c"
        "onstants.float_uniform_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000652 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000652 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000653, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000653 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_0_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000653 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000653 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_0_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000654 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000655 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000656 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000657 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000658 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000659 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000660 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000661 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000662 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_5_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000663 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_5_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000664 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_6_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000665 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_6_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000666 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_7_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000667 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_7_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000668 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.float_8_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000669 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.constants.float_8_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000670 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.int_0_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000671 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.int_0_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000672 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.int_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000673 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.int_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000674 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.int_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000675 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.int_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000676 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.int_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000677 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.int_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000678 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.int_4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000679 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.int_4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000680 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.bool_0_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000681 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.bool_0_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000682 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shad"
        "ers.constants.bool_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000683 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shade"
        "rs.constants.bool_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000684 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.co"
        "nstants.const_float_global_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000685 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.con"
        "stants.const_float_global_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000686 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.c"
        "onstants.const_float_main_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000687 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.co"
        "nstants.const_float_main_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000688 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.con"
        "stants.const_float_function_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000689 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.cons"
        "tants.const_float_function_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000690 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.co"
        "nstants.const_float_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000691 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.con"
        "stants.const_float_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000692 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_scope_shawdowing_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000693 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants"
        ".const_float_scope_shawdowing_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000694 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_scope_shawdowing_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000695 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants"
        ".const_float_scope_shawdowing_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000696 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_scope_shawdowing_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000697 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants"
        ".const_float_scope_shawdowing_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000698 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_scope_shawdowing_4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000699 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants"
        ".const_float_scope_shawdowing_4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000700 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants."
        "const_float_operations_with_const_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000701 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants.c"
        "onst_float_operations_with_const_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000702 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_assignment_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000703 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.consta"
        "nts.const_float_assignment_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000704 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_assignment_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000705 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.consta"
        "nts.const_float_assignment_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000706 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_assignment_3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000707 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.consta"
        "nts.const_float_assignment_3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000708 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_assignment_4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000709 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.consta"
        "nts.const_float_assignment_4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000710 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.consta"
        "nts.const_float_assign_uniform_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000711 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constan"
        "ts.const_float_assign_uniform_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000712 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.con"
        "stants.const_float_assign_varying",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000713 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.con"
        "stants.const_float_from_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000714 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.cons"
        "tants.const_float_from_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000715 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.cons"
        "tants.const_float_from_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000716 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_from_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000717 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.cons"
        "tants.const_float_from_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000718 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_from_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000719 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.cons"
        "tants.const_float_from_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000720 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.const"
        "ants.const_float_from_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000721 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_assign_variable_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000722 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants"
        ".const_float_assign_variable_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000723 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_assign_variable_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000724 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constants"
        ".const_float_assign_variable_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000725 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constan"
        "ts.const_float_assign_user_func_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000726 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant"
        "s.const_float_assign_user_func_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000727 end";
}
