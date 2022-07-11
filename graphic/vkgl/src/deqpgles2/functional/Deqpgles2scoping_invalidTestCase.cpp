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
#include "../ActsDeqpgles20003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002437, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002437 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.i"
        "nvalid.redeclare_global_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002437 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002437 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002438, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002438 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.in"
        "valid.redeclare_global_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002438 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002438 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002439, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002439 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping."
        "invalid.redeclare_local_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002439 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002439 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002440, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002440 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.i"
        "nvalid.redeclare_local_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002440 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002440 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002441, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002441 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid"
        ".redeclare_for_init_statement_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002441 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002441 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002442, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002442 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid."
        "redeclare_for_init_statement_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002442 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002442 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002443, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002443 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inva"
        "lid.redeclare_for_condition_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002443 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002443 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002444, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002444 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inval"
        "id.redeclare_for_condition_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002444 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002444 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.redecla"
        "re_for_init_statement_variable_in_for_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002445 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.redeclar"
        "e_for_init_statement_variable_in_for_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002446 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inval"
        "id.redeclare_while_condition_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002447 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invali"
        "d.redeclare_while_condition_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002448 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002449, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002449 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scopi"
        "ng.invalid.redefine_function_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002449 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002449 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002450, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002450 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scopin"
        "g.invalid.redefine_function_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002450 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002450 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002451, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002451 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scopi"
        "ng.invalid.redeclare_builtin_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002451 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002451 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002452, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002452 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scopin"
        "g.invalid.redeclare_builtin_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002452 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002452 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002453, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002453 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping."
        "invalid.conflict_function_struct_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002453 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002453 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002454, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002454 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.i"
        "nvalid.conflict_function_struct_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002454 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002454 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002455, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002455 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.i"
        "nvalid.conflict_function_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002455 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002455 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002456, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002456 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.in"
        "valid.conflict_function_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002456 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002456 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002457, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002457 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid"
        ".use_global_variable_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002457 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002457 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002458, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002458 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid."
        "use_global_variable_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002458 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002458 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002459, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002459 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid"
        ".use_local_variable_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002459 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002459 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002460, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002460 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid."
        "use_local_variable_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002460 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002460 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002461, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002461 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inval"
        "id.use_struct_type_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002461 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002461 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002462, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002462 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invali"
        "d.use_struct_type_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002462 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002462 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002463, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002463 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inva"
        "lid.use_function_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002463 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002463 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inval"
        "id.use_function_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002464 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid"
        ".use_variable_from_block_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002465 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid."
        "use_variable_from_block_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002466 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invali"
        "d.use_variable_from_if_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002467 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid"
        ".use_variable_from_if_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002468 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid"
        ".use_variable_from_else_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002469 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid."
        "use_variable_from_else_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002470 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.in"
        "valid.use_variable_from_if_in_else_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002471 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.inv"
        "alid.use_variable_from_if_in_else_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002472 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_va"
        "riable_from_for_init_statement_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002473 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_var"
        "iable_from_for_init_statement_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002474 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_"
        "variable_from_while_condition_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002475 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_v"
        "ariable_from_while_condition_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002476 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.use"
        "_parameter_names_from_function_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002477 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_"
        "parameter_names_from_function_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002478 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid."
        "variable_not_visible_in_own_initializer_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002479 end";
}

static HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002480, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002480 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.scoping.invalid.v"
        "ariable_not_visible_in_own_initializer_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20003TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20003TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002480 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002480 end";
}
