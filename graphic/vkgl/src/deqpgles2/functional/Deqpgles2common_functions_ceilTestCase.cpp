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
#include "../ActsDeqpgles20007TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006084 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006085 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006086 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.ceil.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006087 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006088 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006089 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006090, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006090 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".common_functions.ceil.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006090 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006090 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006091 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006092 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.ceil.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006093 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006094 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006095 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".common_functions.ceil.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006096 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006097 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006098 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.ceil.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006099 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006100 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006101 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".common_functions.ceil.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006102 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006103 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006104 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.ceil.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006105 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.ceil.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006106 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.ceil.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006107 end";
}
