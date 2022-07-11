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
#include "../ActsDeqpgles30036TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer."
        "shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035396 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "hared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035397 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer"
        ".shared_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035398 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh"
        "ared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035399 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha"
        "red_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035400 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "hared_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035401 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh"
        "ared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035402 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha"
        "red_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035403 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "hared_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035404 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha"
        "red_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035405 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar"
        "ed_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035406 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh"
        "ared_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035407 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035408, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035408 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh"
        "ared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035408 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035408 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035409, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035409 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha"
        "red_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035409 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035409 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035410, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035410 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "hared_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035410 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035410 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035411, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035411 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha"
        "red_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035411 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035411 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035412, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035412 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar"
        "ed_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035412 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035412 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035413, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035413 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh"
        "ared_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035413 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035413 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035414, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035414 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sha"
        "red_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035414 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035414 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035415, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035415 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar"
        "ed_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035415 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035415 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035416, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035416 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.sh"
        "ared_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035416 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035416 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035417, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035417 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.share"
        "d_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035417 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035417 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035418, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035418 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shared"
        "_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035418 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035418 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035419, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035419 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.shar"
        "ed_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035419 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035419 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035420, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035420 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer."
        "packed_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035420 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035420 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035421, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035421 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.p"
        "acked_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035421 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035421 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035422, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035422 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pa"
        "cked_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035422 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035422 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035423, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035423 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac"
        "ked_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035423 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035423 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035424, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035424 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pa"
        "cked_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035424 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035424 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035425, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035425 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac"
        "ked_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035425 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035425 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035426, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035426 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac"
        "ked_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035426 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035426 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035427, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035427 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pack"
        "ed_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035427 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035427 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035428, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035428 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pa"
        "cked_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035428 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035428 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035429, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035429 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac"
        "ked_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035429 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035429 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035430, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035430 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac"
        "ked_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035430 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035430 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035431, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035431 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pack"
        "ed_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035431 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035431 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035432, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035432 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pac"
        "ked_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035432 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035432 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035433, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035433 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.pack"
        "ed_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035433 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035433 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035434, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035434 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.packe"
        "d_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035434 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035434 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035435, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035435 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.packed"
        "_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035435 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035435 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035436, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035436 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer."
        "std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035436 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035436 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "td140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035437 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer"
        ".std140_block_row_major_matrix_row_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035438 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st"
        "d140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035439 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std"
        "140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035440 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "td140_block_row_major_matrix_row_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035441 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st"
        "d140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035442 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std"
        "140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035443 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "td140_block_row_major_matrix_column_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035444 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std"
        "140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035445 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1"
        "40_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035446 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st"
        "d140_block_row_major_matrix_column_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035447 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st"
        "d140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035448 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std"
        "140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035449 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.s"
        "td140_block_column_major_matrix_row_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035450 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std"
        "140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035451 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1"
        "40_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035452 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st"
        "d140_block_column_major_matrix_row_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035453 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std"
        "140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035454 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1"
        "40_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035455 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.st"
        "d140_block_column_major_matrix_column_major_matrixarray_row_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035456 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std14"
        "0_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035457 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std140"
        "_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035458 end";
}

static HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_035459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.ubo.single_nested_struct_mixed_matrix_packing.single_buffer.std1"
        "40_block_column_major_matrix_column_major_matrixarray_column_major_instance_array_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30036TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30036TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30036TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30036TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30036TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_035459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_035459 end";
}
