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
#include "../ActsDeqpgles20007TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006654, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006654 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.in"
        "t_compare.lessThanEqual.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006654 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006654 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006655, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006655 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006655 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006655 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006656, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006656 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006656 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006656 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006657, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006657 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int_"
        "compare.lessThanEqual.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006657 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006657 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006658, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006658 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.in"
        "t_compare.lessThanEqual.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006658 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006658 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006659, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006659 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006659 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006659 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006660, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006660 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.in"
        "t_compare.lessThanEqual.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006660 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006660 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006661, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006661 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006661 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006661 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006662, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006662 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006662 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006662 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006663, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006663 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int_"
        "compare.lessThanEqual.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006663 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006663 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006664, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006664 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.in"
        "t_compare.lessThanEqual.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006664 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006664 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006665 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.in"
        "t_compare.lessThanEqual.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006666 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006667 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006668 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int_"
        "compare.lessThanEqual.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006669 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.in"
        "t_compare.lessThanEqual.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006670 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.int"
        "_compare.lessThanEqual.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006671 end";
}
