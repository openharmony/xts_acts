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
#include "../ActsDeqpgles30038TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037486, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037486 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037486 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037486 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037487, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037487 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get"
        "_uniform.basic_array_first_elem_without_brackets.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037487 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037487 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037488, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037488 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037488 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037488 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037489, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037489 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037489 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037489 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037490, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037490 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037490 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037490 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037491, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037491 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer."
        "get_uniform.basic_array_first_elem_without_brackets.vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037491 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037491 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037492, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037492 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037492 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037492 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037493, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037493 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037493 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037493 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037494, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037494 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer."
        "get_uniform.basic_array_first_elem_without_brackets.mat4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037494 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037494 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037495, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037495 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.mat4_row_major_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037495 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037495 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037496, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037496 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni"
        "form.basic_array_first_elem_without_brackets.mat4_row_major_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037496 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037496 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037497, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037497 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.mat4_row_major_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037497 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037497 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037498, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037498 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037498 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037498 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037499, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037499 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037499 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037499 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037500, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037500 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer."
        "get_uniform.basic_array_first_elem_without_brackets.int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037500 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037500 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037501, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037501 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037501 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037501 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037502, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037502 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get"
        "_uniform.basic_array_first_elem_without_brackets.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037502 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037502 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037503, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037503 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037503 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037503 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037504, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037504 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037504 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037504 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037505, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037505 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037505 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037505 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037506, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037506 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer."
        "get_uniform.basic_array_first_elem_without_brackets.uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037506 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037506 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037507, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037507 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge"
        "t_uniform.basic_array_first_elem_without_brackets.uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037507 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037507 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037508, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037508 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get"
        "_uniform.basic_array_first_elem_without_brackets.uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037508 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037508 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037509, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037509 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g"
        "et_uniform.basic_array_first_elem_without_brackets.uvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037509 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037509 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037510, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037510 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.bool_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037510 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037510 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037511, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037511 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni"
        "form.basic_array_first_elem_without_brackets.bool_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037511 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037511 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037512, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037512 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.bool_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037512 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037512 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037513, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037513 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.bool_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037513 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037513 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037514, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037514 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.bool_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037514 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037514 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037515, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037515 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_"
        "uniform.basic_array_first_elem_without_brackets.bool_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037515 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037515 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037516, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037516 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.bool_api_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037516 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037516 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037517, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037517 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni"
        "form.basic_array_first_elem_without_brackets.bool_api_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037517 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037517 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037518, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037518 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.bool_api_uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037518 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037518 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037519, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037519 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni"
        "form.basic_array_first_elem_without_brackets.bvec4_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037519 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037519 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037520, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037520 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_unif"
        "orm.basic_array_first_elem_without_brackets.bvec4_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037520 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037520 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037521, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037521 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.bvec4_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037521 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037521 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037522, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037522 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.bvec4_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037522 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037522 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037523, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037523 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni"
        "form.basic_array_first_elem_without_brackets.bvec4_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037523 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037523 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037524, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037524 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.bvec4_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037524 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037524 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037525, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037525 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un"
        "iform.basic_array_first_elem_without_brackets.bvec4_api_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037525 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037525 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037526, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037526 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni"
        "form.basic_array_first_elem_without_brackets.bvec4_api_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037526 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037526 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037527, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037527 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.bvec4_api_uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037527 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037527 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037528, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037528 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_"
        "uniform.basic_array_first_elem_without_brackets.sampler2D_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037528 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037528 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037529, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037529 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u"
        "niform.basic_array_first_elem_without_brackets.sampler2D_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037529 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037529 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037530, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037530 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get"
        "_uniform.basic_array_first_elem_without_brackets.sampler2D_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037530 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037530 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037951, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037951 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get"
        "_uniform.basic_array_first_elem_without_brackets.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037951 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037951 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037952, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037952 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_"
        "uniform.basic_array_first_elem_without_brackets.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037952 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037952 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037953, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037953 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge"
        "t_uniform.basic_array_first_elem_without_brackets.float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037953 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037953 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037954, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037954 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge"
        "t_uniform.basic_array_first_elem_without_brackets.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037954 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037954 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037955, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037955 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get"
        "_uniform.basic_array_first_elem_without_brackets.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037955 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037955 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037956, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037956 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g"
        "et_uniform.basic_array_first_elem_without_brackets.vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037956 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037956 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037957, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037957 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge"
        "t_uniform.basic_array_first_elem_without_brackets.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037957 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037957 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037958, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037958 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get"
        "_uniform.basic_array_first_elem_without_brackets.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037958 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037958 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037959, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037959 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g"
        "et_uniform.basic_array_first_elem_without_brackets.int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037959 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037959 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get"
        "_uniform.basic_array_first_elem_without_brackets.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037960 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_"
        "uniform.basic_array_first_elem_without_brackets.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037961 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge"
        "t_uniform.basic_array_first_elem_without_brackets.ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037962 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge"
        "t_uniform.basic_array_first_elem_without_brackets.uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037963 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get"
        "_uniform.basic_array_first_elem_without_brackets.uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037964 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g"
        "et_uniform.basic_array_first_elem_without_brackets.uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037965 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get"
        "_uniform.basic_array_first_elem_without_brackets.uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037966 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_"
        "uniform.basic_array_first_elem_without_brackets.uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037967 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge"
        "t_uniform.basic_array_first_elem_without_brackets.uvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037968 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni"
        "form.basic_array_first_elem_without_brackets.bool_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037969 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif"
        "orm.basic_array_first_elem_without_brackets.bool_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037970 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un"
        "iform.basic_array_first_elem_without_brackets.bool_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037971 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un"
        "iform.basic_array_first_elem_without_brackets.bool_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037972 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni"
        "form.basic_array_first_elem_without_brackets.bool_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037973 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_u"
        "niform.basic_array_first_elem_without_brackets.bool_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037974 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni"
        "form.basic_array_first_elem_without_brackets.bool_api_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037975 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif"
        "orm.basic_array_first_elem_without_brackets.bool_api_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037976 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un"
        "iform.basic_array_first_elem_without_brackets.bool_api_uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037977 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif"
        "orm.basic_array_first_elem_without_brackets.bvec4_api_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037978 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unifo"
        "rm.basic_array_first_elem_without_brackets.bvec4_api_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037979 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni"
        "form.basic_array_first_elem_without_brackets.bvec4_api_float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037980 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni"
        "form.basic_array_first_elem_without_brackets.bvec4_api_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037981 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif"
        "orm.basic_array_first_elem_without_brackets.bvec4_api_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037982 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un"
        "iform.basic_array_first_elem_without_brackets.bvec4_api_int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037983 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni"
        "form.basic_array_first_elem_without_brackets.bvec4_api_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037984 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif"
        "orm.basic_array_first_elem_without_brackets.bvec4_api_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037985 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un"
        "iform.basic_array_first_elem_without_brackets.bvec4_api_uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037986 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_u"
        "niform.basic_array_first_elem_without_brackets.sampler2D_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037987 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un"
        "iform.basic_array_first_elem_without_brackets.sampler2D_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037988 end";
}

static HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_037989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_"
        "uniform.basic_array_first_elem_without_brackets.sampler2D_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30038TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30038TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30038TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30038TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30038TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_037989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_037989 end";
}
