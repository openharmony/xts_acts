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

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014396, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014396 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.init"
        "ial.render.struct_in_array.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014396 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014396 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014397, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014397 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initi"
        "al.render.struct_in_array.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014397 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014397 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014398, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014398 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ini"
        "tial.render.struct_in_array.float_vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014398 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014398 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014399, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014399 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ini"
        "tial.render.struct_in_array.mat4_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014399 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014399 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014400, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014400 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.init"
        "ial.render.struct_in_array.mat4_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014400 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014400 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014401, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014401 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.in"
        "itial.render.struct_in_array.mat4_mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014401 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014401 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014402, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014402 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ini"
        "tial.render.struct_in_array.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014402 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014402 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014403, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014403 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.init"
        "ial.render.struct_in_array.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014403 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014403 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014404, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014404 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.in"
        "itial.render.struct_in_array.int_ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014404 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014404 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014405, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014405 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.init"
        "ial.render.struct_in_array.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014405 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014405 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014406, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014406 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.initi"
        "al.render.struct_in_array.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014406 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014406 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014407, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014407 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ini"
        "tial.render.struct_in_array.bool_bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014407 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014407 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_pointer.render.struct_in_array.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014719 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_pointer.render.struct_in_array.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014720 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_pointer.render.struct_in_array.float_vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014721 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_pointer.render.struct_in_array.mat4_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014722 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_pointer.render.struct_in_array.mat4_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014723 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_pointer.render.struct_in_array.mat4_mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014724 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_pointer.render.struct_in_array.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014725 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_pointer.render.struct_in_array.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014726 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_pointer.render.struct_in_array.int_ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014727 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_pointer.render.struct_in_array.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014728 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by"
        "_pointer.render.struct_in_array.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014729 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_pointer.render.struct_in_array.bool_bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014730 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi"
        "nter.render.struct_in_array.sampler2D_samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014731 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin"
        "ter.render.struct_in_array.sampler2D_samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014732 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po"
        "inter.render.struct_in_array.sampler2D_samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014733 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.render.struct_in_array.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015008 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.render.struct_in_array.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015009 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.render.struct_in_array.float_vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015010 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.render.struct_in_array.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015011 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.render.struct_in_array.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015012 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.by_value.render.struct_in_array.int_ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015013 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "by_value.render.struct_in_array.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015014 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "y_value.render.struct_in_array.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015015 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".by_value.render.struct_in_array.bool_bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015016 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va"
        "lue.render.struct_in_array.sampler2D_samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015017 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val"
        "ue.render.struct_in_array.sampler2D_samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015018 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v"
        "alue.render.struct_in_array.sampler2D_samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015019 end";
}
