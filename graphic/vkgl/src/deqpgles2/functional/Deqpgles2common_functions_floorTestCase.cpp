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

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006060 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006061 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.floor.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006062 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.com"
        "mon_functions.floor.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006063 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006064 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.floor.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006065 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.lowp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006066 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.lowp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006067 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006068 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.floor.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006069 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006070 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006071 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.lowp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006072 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.lowp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006073 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006074 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.floor.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006075 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006076 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006077 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.lowp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006078 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.lowp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006079 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006080 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.co"
        "mmon_functions.floor.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006081 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "common_functions.floor.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006082 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.c"
        "ommon_functions.floor.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006083 end";
}
