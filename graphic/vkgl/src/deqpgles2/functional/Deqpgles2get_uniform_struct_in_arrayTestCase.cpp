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
#include "../ActsDeqpgles20015TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initia"
        "l.get_uniform.struct_in_array.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014257 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial"
        ".get_uniform.struct_in_array.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014258 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initi"
        "al.get_uniform.struct_in_array.float_vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014259 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initia"
        "l.get_uniform.struct_in_array.mat4_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014260 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial"
        ".get_uniform.struct_in_array.mat4_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014261 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initi"
        "al.get_uniform.struct_in_array.mat4_mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014262 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initia"
        "l.get_uniform.struct_in_array.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014263 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial"
        ".get_uniform.struct_in_array.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014264 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initi"
        "al.get_uniform.struct_in_array.int_ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014265 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initia"
        "l.get_uniform.struct_in_array.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014266 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial"
        ".get_uniform.struct_in_array.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014267 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initi"
        "al.get_uniform.struct_in_array.bool_bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014268 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial.get_"
        "uniform.struct_in_array.sampler2D_samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014269 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial.get_u"
        "niform.struct_in_array.sampler2D_samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014270 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initial.get"
        "_uniform.struct_in_array.sampler2D_samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014271 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014577, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014577 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "pointer.get_uniform.struct_in_array.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014577 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014577 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014578, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014578 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p"
        "ointer.get_uniform.struct_in_array.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014578 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014578 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014579, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014579 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_pointer.get_uniform.struct_in_array.float_vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014579 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014579 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014580, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014580 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "pointer.get_uniform.struct_in_array.mat4_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014580 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014580 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014581, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014581 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p"
        "ointer.get_uniform.struct_in_array.mat4_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014581 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014581 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014582, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014582 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_pointer.get_uniform.struct_in_array.mat4_mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014582 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014582 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014583, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014583 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "pointer.get_uniform.struct_in_array.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014583 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014583 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014584, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014584 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p"
        "ointer.get_uniform.struct_in_array.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014584 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014584 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014585, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014585 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_pointer.get_uniform.struct_in_array.int_ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014585 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014585 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014586, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014586 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "pointer.get_uniform.struct_in_array.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014586 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014586 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014587, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014587 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p"
        "ointer.get_uniform.struct_in_array.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014587 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014587 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014588, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014588 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_pointer.get_uniform.struct_in_array.bool_bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014588 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014588 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014589, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014589 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointe"
        "r.get_uniform.struct_in_array.sampler2D_samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014589 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014589 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014590, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014590 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer"
        ".get_uniform.struct_in_array.sampler2D_samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014590 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014590 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014591, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014591 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_point"
        "er.get_uniform.struct_in_array.sampler2D_samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014591 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014591 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014891, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014891 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_value.get_uniform.struct_in_array.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014891 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014891 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014892, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014892 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "value.get_uniform.struct_in_array.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014892 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014892 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014893, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014893 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.get_uniform.struct_in_array.float_vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014893 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014893 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014894, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014894 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_value.get_uniform.struct_in_array.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014894 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014894 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014895, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014895 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "value.get_uniform.struct_in_array.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014895 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014895 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014896, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014896 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.get_uniform.struct_in_array.int_ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014896 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014896 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014897, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014897 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_value.get_uniform.struct_in_array.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014897 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014897 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014898, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014898 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_"
        "value.get_uniform.struct_in_array.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014898 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014898 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014899, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014899 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.get_uniform.struct_in_array.bool_bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014899 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014899 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014900, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014900 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value"
        ".get_uniform.struct_in_array.sampler2D_samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014900 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014900 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014901, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014901 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value."
        "get_uniform.struct_in_array.sampler2D_samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014901 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014901 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014902, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014902 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_valu"
        "e.get_uniform.struct_in_array.sampler2D_samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014902 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014902 end";
}
