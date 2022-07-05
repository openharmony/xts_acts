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
#include "../ActsDeqpgles20016TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015050 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015051 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015052 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015053 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015054 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015055 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015056 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015057 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.mat4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015058 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015059 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015060 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assign"
        "ed.basic_array_assign_full.basic_array.int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015061 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015062 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015063 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015064 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015065 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015066 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.bool_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015067 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned"
        ".basic_array_assign_full.basic_array.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015068 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015069 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigne"
        "d.basic_array_assign_full.basic_array.bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015070 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.b"
        "asic_array_assign_full.basic_array.sampler2D_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015071 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned.ba"
        "sic_array_assign_full.basic_array.sampler2D_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015072 end";
}

static HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_015073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.assigned."
        "basic_array_assign_full.basic_array.sampler2D_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20016TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20016TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20016TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20016TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20016TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_015073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_015073 end";
}
