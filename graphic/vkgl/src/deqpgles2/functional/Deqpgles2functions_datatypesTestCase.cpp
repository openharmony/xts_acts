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
#include "../ActsDeqpgles20002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001996 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.funct"
        "ions.datatypes.float_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001997 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.float_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001998 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001999 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.float_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002000 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002001 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.float_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002002 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002003 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.float_mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002004 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002005 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.float_mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002006 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002007 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.float_mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002008 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002009 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fu"
        "nctions.datatypes.int_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002010 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.int_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002011 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.int_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002012 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.int_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002013 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.int_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002014 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.int_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002015 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.int_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002016 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.int_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002017 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.bool_bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002018 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.bool_bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002019 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.bool_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002020 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.bool_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002021 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.bool_bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002022 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.bool_bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002023 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.fun"
        "ctions.datatypes.bool_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002024 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.bool_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002025 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002026, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002026 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "functions.datatypes.mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002026 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002026 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002027, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002027 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.f"
        "unctions.datatypes.mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002027 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002027 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002028, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002028 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "functions.datatypes.mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002028 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002028 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002029, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002029 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.f"
        "unctions.datatypes.mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002029 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002029 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002030, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002030 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "functions.datatypes.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002030 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002030 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002031, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002031 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.f"
        "unctions.datatypes.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002031 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002031 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002032, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002032 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.func"
        "tions.datatypes.float_struct_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002032 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002032 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002033, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002033 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.funct"
        "ions.datatypes.float_struct_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002033 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002033 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002034, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002034 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.funct"
        "ions.datatypes.struct_struct_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002034 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002034 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002035, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002035 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functi"
        "ons.datatypes.struct_struct_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002035 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002035 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002036, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002036 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.function"
        "s.datatypes.struct_nested_struct_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002036 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002036 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002037, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002037 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functions"
        ".datatypes.struct_nested_struct_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002037 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002037 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002038, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002038 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.functions.dat"
        "atypes.struct_constructor_highp_in_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002038 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002038 end";
}
