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
#include "../ActsDeqpgles30001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000665, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000665 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffe"
        "r.copy.basic.array_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000665 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000665 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000666, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000666 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer"
        ".copy.basic.array_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000666 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000666 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000667, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000667 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.array_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000667 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000667 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000668, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000668 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer"
        ".copy.basic.array_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000668 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000668 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000669, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000669 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.array_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000669 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000669 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000670, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000670 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.cop"
        "y.basic.array_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000670 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000670 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000671, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000671 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buff"
        "er.copy.basic.array_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000671 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000671 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000672, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000672 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffe"
        "r.copy.basic.copy_read_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000672 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000672 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000673, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000673 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.copy_read_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000673 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000673 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000674, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000674 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.copy_read_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000674 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000674 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000675, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000675 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.copy_read_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000675 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000675 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000676, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000676 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.copy_read_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000676 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000676 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000677, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000677 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy."
        "basic.copy_read_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000677 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000677 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000678, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000678 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer"
        ".copy.basic.copy_read_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000678 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000678 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000679, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000679 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer"
        ".copy.basic.copy_write_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000679 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000679 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000680, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000680 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.copy_write_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000680 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000680 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000681, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000681 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.cop"
        "y.basic.copy_write_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000681 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000681 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000682, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000682 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.copy_write_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000682 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000682 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000683, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000683 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.copy_write_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000683 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000683 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000684, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000684 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy."
        "basic.copy_write_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000684 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000684 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000685, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000685 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.copy_write_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000685 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000685 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000686, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000686 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.element_array_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000686 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000686 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000687, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000687 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.element_array_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000687 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000687 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000688, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000688 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.cop"
        "y.basic.element_array_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000688 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000688 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000689, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000689 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.cop"
        "y.basic.element_array_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000689 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000689 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000690, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000690 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy"
        ".basic.element_array_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000690 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000690 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy.ba"
        "sic.element_array_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000691 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.element_array_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000692 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer"
        ".copy.basic.pixel_pack_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000693 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.pixel_pack_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000694 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.pixel_pack_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000695 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.cop"
        "y.basic.pixel_pack_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000696 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.pixel_pack_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000697 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy."
        "basic.pixel_pack_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000698 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.pixel_pack_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000699 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.pixel_unpack_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000700 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.pixel_unpack_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000701 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.pixel_unpack_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000702 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy"
        ".basic.pixel_unpack_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000703 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.co"
        "py.basic.pixel_unpack_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000704 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy.b"
        "asic.pixel_unpack_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000705 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.pixel_unpack_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000706 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.cop"
        "y.basic.transform_feedback_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000707 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy."
        "basic.transform_feedback_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000708 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy."
        "basic.transform_feedback_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000709 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy.ba"
        "sic.transform_feedback_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000710 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy."
        "basic.transform_feedback_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000711 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy.b"
        "asic.transform_feedback_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000712 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy"
        ".basic.transform_feedback_uniform",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000713 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buff"
        "er.copy.basic.uniform_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000714 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer"
        ".copy.basic.uniform_copy_read",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000715 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.uniform_copy_write",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000716 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.uniform_element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000717 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer."
        "copy.basic.uniform_pixel_pack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000718 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.c"
        "opy.basic.uniform_pixel_unpack",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000719 end";
}

static HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.buffer.copy"
        ".basic.uniform_transform_feedback",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000720 end";
}
