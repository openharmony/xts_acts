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
#include "../ActsDeqpgles20014TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013628, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013628 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.nega"
        "tive_api.buffer.bind_buffer",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013628 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013628 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negati"
        "ve_api.buffer.delete_buffers",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013629 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.nega"
        "tive_api.buffer.gen_buffers",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013630 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.nega"
        "tive_api.buffer.buffer_data",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013631 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negati"
        "ve_api.buffer.buffer_sub_data",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013632 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api"
        ".buffer.buffer_sub_data_size_offset",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013633 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.n"
        "egative_api.buffer.clear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013634 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.nega"
        "tive_api.buffer.read_pixels",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013635 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api"
        ".buffer.read_pixels_format_mismatch",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013636 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negativ"
        "e_api.buffer.bind_framebuffer",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013637 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negativ"
        "e_api.buffer.bind_renderbuffer",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013638 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_ap"
        "i.buffer.check_framebuffer_status",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013639 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negativ"
        "e_api.buffer.gen_framebuffers",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013640 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negativ"
        "e_api.buffer.gen_renderbuffers",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013641 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative"
        "_api.buffer.delete_framebuffers",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013642 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_"
        "api.buffer.delete_renderbuffers",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013643 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_ap"
        "i.buffer.framebuffer_renderbuffer",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013644 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_"
        "api.buffer.framebuffer_texture2d",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013645 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_"
        "api.buffer.renderbuffer_storage",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013646 end";
}
