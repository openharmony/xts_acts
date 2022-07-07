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
#include "../ActsDeqpgles30043TestSuite.h"

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042956, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042956 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.intege"
        "rs.implementation_color_read_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042956 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042956 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.inte"
        "gers.implementation_color_read_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042957 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.read_buffer_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042958 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.read_buffer_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042959 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.read_buffer_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042960 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.read_buffer_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042961 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.draw_buffer_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042962 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.draw_buffer_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042963 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.draw_buffer_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042964 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.draw_buffer_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042965 end";
}
