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

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.intege"
        "rs.max_program_texel_offset_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042518 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.inte"
        "gers.max_program_texel_offset_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042519 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.intege"
        "rs.max_uniform_buffer_bindings_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042520 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integer"
        "s.max_uniform_buffer_bindings_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042521 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integ"
        "ers.max_uniform_buffer_bindings_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042522 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042523, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042523 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.intege"
        "rs.max_combined_uniform_blocks_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042523 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042523 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042524, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042524 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integer"
        "s.max_combined_uniform_blocks_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042524 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042524 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042525, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042525 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integ"
        "ers.max_combined_uniform_blocks_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042525 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042525 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042526, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042526 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.inte"
        "gers.max_varying_components_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042526 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042526 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042527, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042527 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integ"
        "ers.max_varying_components_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042527 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042527 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042528, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042528 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.int"
        "egers.max_varying_components_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042528 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042528 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042529, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042529 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.in"
        "tegers.max_varying_vectors_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042529 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042529 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042530, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042530 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.int"
        "egers.max_varying_vectors_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042530 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042530 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042531, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042531 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.i"
        "ntegers.max_varying_vectors_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042531 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042531 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042532, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042532 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers."
        "max_combined_texture_image_units_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042532 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042532 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042533, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042533 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.m"
        "ax_combined_texture_image_units_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042533 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042533 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042534, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042534 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers"
        ".max_combined_texture_image_units_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042534 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042534 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042535, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042535 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_tr"
        "ansform_feedback_interleaved_components_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042535 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042535 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042536, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042536 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_tra"
        "nsform_feedback_interleaved_components_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042536 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042536 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042537, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042537 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_t"
        "ransform_feedback_interleaved_components_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042537 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042537 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042538, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042538 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max"
        "_transform_feedback_separate_attribs_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042538 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042538 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042539, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042539 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_"
        "transform_feedback_separate_attribs_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042539 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042539 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042540, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042540 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.ma"
        "x_transform_feedback_separate_attribs_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042540 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042540 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042541, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042541 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_t"
        "ransform_feedback_separate_components_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042541 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042541 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042542, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042542 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_tr"
        "ansform_feedback_separate_components_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042542 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042542 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042543, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042543 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers.max_"
        "transform_feedback_separate_components_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042543 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042543 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042544, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042544 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.max_samples_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042544 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042544 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042545, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042545 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.max_samples_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042545 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042545 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042546, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042546 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.max_samples_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042546 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042546 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042547, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042547 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.red_bits_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042547 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042547 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042548, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042548 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.red_bits_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042548 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042548 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042549, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042549 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.integers.red_bits_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042549 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042549 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042550, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042550 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.green_bits_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042550 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042550 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042551, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042551 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.green_bits_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042551 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042551 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042552, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042552 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.green_bits_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042552 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042552 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042553, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042553 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.blue_bits_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042553 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042553 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042554, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042554 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.blue_bits_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042554 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042554 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042555, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042555 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.integers.blue_bits_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042555 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042555 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042556, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042556 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.alpha_bits_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042556 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042556 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042557, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042557 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.alpha_bits_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042557 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042557 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042558, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042558 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.alpha_bits_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042558 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042558 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042559, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042559 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.depth_bits_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042559 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042559 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042560, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042560 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.depth_bits_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042560 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042560 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042561, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042561 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.depth_bits_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042561 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042561 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042562, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042562 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.stencil_bits_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042562 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042562 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042563, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042563 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "integers.stencil_bits_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042563 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042563 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042564, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042564 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.stencil_bits_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042564 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042564 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042565, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042565 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integ"
        "ers.min_program_texel_offset_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042565 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042565 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042566, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042566 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.intege"
        "rs.min_program_texel_offset_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042566 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042566 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042567, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042567 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.inte"
        "gers.min_program_texel_offset_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042567 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042567 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042568, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042568 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers"
        ".uniform_buffer_offset_alignment_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042568 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042568 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042569, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042569 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers."
        "uniform_buffer_offset_alignment_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042569 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042569 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042570, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042570 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integer"
        "s.uniform_buffer_offset_alignment_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042570 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042570 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042571, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042571 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "integers.sample_buffers_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042571 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042571 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042572, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042572 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.i"
        "ntegers.sample_buffers_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042572 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042572 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042573, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042573 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.sample_buffers_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042573 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042573 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042574, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042574 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.integers.samples_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042574 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042574 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042575, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042575 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_qu"
        "ery.integers.samples_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042575 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042575 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042576, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042576 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.samples_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042576 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042576 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042577, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042577 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_q"
        "uery.integers.samples_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042577 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042577 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042578, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042578 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.int"
        "egers.generate_mipmap_hint_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042578 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042578 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042579, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042579 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.int"
        "egers.generate_mipmap_hint_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042579 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042579 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042580, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042580 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.inte"
        "gers.generate_mipmap_hint_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042580 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042580 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042581, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042581 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.in"
        "tegers.generate_mipmap_hint_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042581 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042581 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042582, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042582 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers"
        ".fragment_shader_derivative_hint_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042582 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042582 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042583, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042583 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers"
        ".fragment_shader_derivative_hint_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042583 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042583 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042584, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042584 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integers."
        "fragment_shader_derivative_hint_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042584 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042584 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042585, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042585 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query.integer"
        "s.fragment_shader_derivative_hint_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042585 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042585 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042586, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042586 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.depth_func_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042586 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042586 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042587, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042587 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_quer"
        "y.integers.depth_func_getinteger",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042587 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042587 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042588, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042588 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query"
        ".integers.depth_func_getinteger64",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042588 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042588 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042589, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042589 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_que"
        "ry.integers.depth_func_getfloat",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042589 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042589 end";
}

static HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_042590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.state_query."
        "integers.cull_face_mode_getboolean",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30043TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30043TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30043TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30043TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30043TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_042590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_042590 end";
}
