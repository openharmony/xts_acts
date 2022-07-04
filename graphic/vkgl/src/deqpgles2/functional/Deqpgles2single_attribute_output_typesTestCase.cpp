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

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float2_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013109 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float2_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013110 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float3_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013111 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float3_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013112 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float4_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013113 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float4_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013114 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float2_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013115 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float2_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013116 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float3_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013117 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float3_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013118 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float4_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013119 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float4_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013120 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float2_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013121 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float2_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013122 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float3_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013123 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float3_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013124 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_float4_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013125 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_float4_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013126 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short2_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013127 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short2_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013128 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short3_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013129 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short3_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013130 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short4_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013131 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013132, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013132 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short4_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013132 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013132 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013133, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013133 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short2_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013133 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013133 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013134, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013134 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short2_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013134 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013134 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short3_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013135 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short3_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013136 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short4_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013137 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013138, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013138 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short4_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013138 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013138 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013139, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013139 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short2_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013139 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013139 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short2_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013140 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short3_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013141 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short3_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013142 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_short4_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013143 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_short4_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013144 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte2_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013145 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte2_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013146 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte3_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013147 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte3_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013148 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte4_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013149 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte4_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013150 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte2_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013151 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013152, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013152 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte2_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013152 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013152 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013153, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013153 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte3_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013153 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013153 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013154, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013154 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte3_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013154 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013154 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013155, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013155 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte4_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013155 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013155 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013156, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013156 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte4_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013156 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013156 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013157, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013157 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte2_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013157 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013157 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013158, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013158 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte2_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013158 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013158 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013159, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013159 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte3_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013159 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013159 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013160, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013160 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte3_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013160 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013160 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013161, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013161 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.ou"
        "tput_types.user_ptr_0_0_byte4_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013161 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013161 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013162, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013162 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.out"
        "put_types.user_ptr_0_0_byte4_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013162 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013162 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013163, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013163 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short2_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013163 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013163 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013164, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013164 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short2_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013164 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013164 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013165, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013165 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short3_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013165 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013165 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013166, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013166 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short3_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013166 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013166 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013167, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013167 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short4_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013167 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013167 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013168, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013168 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short4_vec2_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013168 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013168 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013169, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013169 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short2_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013169 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013169 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013170, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013170 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short2_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013170 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013170 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013171, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013171 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short3_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013171 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013171 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013172, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013172 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short3_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013172 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013172 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013173, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013173 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short4_vec3_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013173 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013173 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013174, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013174 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short4_vec3_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013174 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013174 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013175, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013175 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short2_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013175 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013175 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013176, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013176 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short2_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013176 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013176 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013177, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013177 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short3_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013177 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013177 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013178, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013178 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short3_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013178 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013178 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013179, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013179 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_"
        "types.user_ptr_0_0_unsigned_short4_vec4_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013179 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013179 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013180, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013180 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output_t"
        "ypes.user_ptr_0_0_unsigned_short4_vec4_dynamic_draw_quads_256",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013180 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013180 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013181, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013181 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.vertex_arrays.single_attribute.output"
        "_types.user_ptr_0_0_unsigned_byte2_vec2_dynamic_draw_quads_1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013181 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013181 end";
}
