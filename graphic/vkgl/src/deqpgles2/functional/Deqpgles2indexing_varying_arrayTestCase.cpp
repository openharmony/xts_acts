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
#include "../ActsDeqpgles20003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.float_static_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002739 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.var"
        "ying_array.float_static_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002740 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.float_static_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002741 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.float_static_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002742 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.var"
        "ying_array.float_dynamic_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002743 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.var"
        "ying_array.float_dynamic_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002744 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.float_dynamic_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002745 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyin"
        "g_array.float_dynamic_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002746 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.float_static_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002747 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.float_static_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002748 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.float_static_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002749 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying_"
        "array.float_static_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002750 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.float_dynamic_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002751 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyin"
        "g_array.float_dynamic_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002752 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying_"
        "array.float_dynamic_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002753 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying_"
        "array.float_dynamic_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002754 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec2_static_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002755 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec2_static_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002756 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vary"
        "ing_array.vec2_static_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002757 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec2_static_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002758 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec2_dynamic_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002759 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.var"
        "ying_array.vec2_dynamic_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002760 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec2_dynamic_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002761 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002762, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002762 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec2_dynamic_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002762 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002762 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002763, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002763 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vary"
        "ing_array.vec2_static_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002763 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002763 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec2_static_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002764 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec2_static_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002765 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec2_static_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002766 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec2_dynamic_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002767 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec2_dynamic_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002768 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec2_dynamic_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002769 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying_"
        "array.vec2_dynamic_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002770 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec3_static_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002771 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec3_static_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002772 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vary"
        "ing_array.vec3_static_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002773 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec3_static_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002774 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec3_dynamic_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002775 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.var"
        "ying_array.vec3_dynamic_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002776 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec3_dynamic_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002777 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec3_dynamic_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002778 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vary"
        "ing_array.vec3_static_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002779 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec3_static_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002780 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec3_static_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002781 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec3_static_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002782 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec3_dynamic_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002783 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec3_dynamic_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002784 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec3_dynamic_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002785 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying_"
        "array.vec3_dynamic_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002786 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec4_static_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002787 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec4_static_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002788 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vary"
        "ing_array.vec4_static_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002789 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec4_static_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002790 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.va"
        "rying_array.vec4_dynamic_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002791 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.var"
        "ying_array.vec4_dynamic_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002792 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec4_dynamic_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002793 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec4_dynamic_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002794 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.vary"
        "ing_array.vec4_static_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002795 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec4_static_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002796 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec4_static_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002797 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec4_static_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002798 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec4_dynamic_loop_write_static_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002799 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varyi"
        "ng_array.vec4_dynamic_loop_write_dynamic_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002800 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying"
        "_array.vec4_dynamic_loop_write_static_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002801 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.varying_"
        "array.vec4_dynamic_loop_write_dynamic_loop_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002802 end";
}
