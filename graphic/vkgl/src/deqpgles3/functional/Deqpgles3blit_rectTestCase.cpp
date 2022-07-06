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
#include "../ActsDeqpgles30033TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fb"
        "o.blit.rect.basic_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032060 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fb"
        "o.blit.rect.basic_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032061 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_src_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032062 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_src_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032063 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_src_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032064 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_src_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032065 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_dst_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032066 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_dst_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032067 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_dst_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032068 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.basic_reverse_dst_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032069 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.basic_reverse_src_dst_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032070 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.basic_reverse_src_dst_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032071 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.basic_reverse_src_dst_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032072 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.basic_reverse_src_dst_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032073 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fb"
        "o.blit.rect.scale_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032074 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fb"
        "o.blit.rect.scale_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032075 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_src_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032076 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_src_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032077 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_src_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032078 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_src_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032079 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_dst_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032080 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_dst_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032081 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_dst_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032082 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit."
        "rect.scale_reverse_dst_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032083 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.scale_reverse_src_dst_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032084 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.scale_reverse_src_dst_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032085 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.scale_reverse_src_dst_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032086 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.re"
        "ct.scale_reverse_src_dst_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032087 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.bl"
        "it.rect.out_of_bounds_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032088 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.bl"
        "it.rect.out_of_bounds_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032089 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_src_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032090 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_src_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032091 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_src_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032092 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_src_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032093 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_dst_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032094 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_dst_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032095 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_dst_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032096 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect"
        ".out_of_bounds_reverse_dst_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032097 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.o"
        "ut_of_bounds_reverse_src_dst_x_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032098 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.o"
        "ut_of_bounds_reverse_src_dst_x_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032099 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.o"
        "ut_of_bounds_reverse_src_dst_y_nearest",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032100 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.o"
        "ut_of_bounds_reverse_src_dst_y_linear",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032101 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.bli"
        "t.rect.nearest_consistency_mag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032102 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_mag_reverse_src_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032103 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_mag_reverse_src_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032104 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_mag_reverse_dst_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032105 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_mag_reverse_dst_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032106 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.ne"
        "arest_consistency_mag_reverse_src_dst_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032107 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.ne"
        "arest_consistency_mag_reverse_src_dst_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032108 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.bli"
        "t.rect.nearest_consistency_min",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032109 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_min_reverse_src_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032110 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_min_reverse_src_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032111 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_min_reverse_dst_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032112 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect."
        "nearest_consistency_min_reverse_dst_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032113 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.ne"
        "arest_consistency_min_reverse_src_dst_x",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032114 end";
}

static HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_032115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.fbo.blit.rect.ne"
        "arest_consistency_min_reverse_src_dst_y",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30033TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30033TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30033TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30033TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30033TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_032115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_032115 end";
}
