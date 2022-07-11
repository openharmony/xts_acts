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
#include "../ActsDeqpgles30005TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004960, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004960 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.i"
        "nvalid.redeclare_global_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004960 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004960 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004961, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004961 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.in"
        "valid.redeclare_global_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004961 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004961 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004962, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004962 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping."
        "invalid.redeclare_local_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004962 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004962 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.i"
        "nvalid.redeclare_local_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004963 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid"
        ".redeclare_for_init_statement_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004964 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "redeclare_for_init_statement_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004965 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inva"
        "lid.redeclare_for_condition_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004966 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inval"
        "id.redeclare_for_condition_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004967 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.redecla"
        "re_for_init_statement_variable_in_for_condition_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004968 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.redeclar"
        "e_for_init_statement_variable_in_for_condition_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004969 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inval"
        "id.redeclare_while_condition_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004970 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invali"
        "d.redeclare_while_condition_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004971 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scopi"
        "ng.invalid.redefine_function_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004972 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scopin"
        "g.invalid.redefine_function_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004973 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scopi"
        "ng.invalid.redeclare_builtin_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004974 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scopin"
        "g.invalid.redeclare_builtin_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004975 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scop"
        "ing.invalid.redefine_builtin_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004976 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scopi"
        "ng.invalid.redefine_builtin_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004977 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping."
        "invalid.conflict_function_struct_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004978 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.i"
        "nvalid.conflict_function_struct_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004979 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.i"
        "nvalid.conflict_function_variable_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004980 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.in"
        "valid.conflict_function_variable_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004981 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid"
        ".use_global_variable_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004982 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "use_global_variable_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004983 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid"
        ".use_local_variable_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004984 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "use_local_variable_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004985 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inval"
        "id.use_struct_type_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004986 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invali"
        "d.use_struct_type_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004987 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inva"
        "lid.use_function_before_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004988 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inval"
        "id.use_function_before_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004989 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid"
        ".use_variable_from_block_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004990 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "use_variable_from_block_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004991 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invali"
        "d.use_variable_from_if_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004992 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid"
        ".use_variable_from_if_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004993 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid"
        ".use_variable_from_else_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004994 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "use_variable_from_else_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004995 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.in"
        "valid.use_variable_from_if_in_else_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004996 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.inv"
        "alid.use_variable_from_if_in_else_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004997 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_va"
        "riable_from_for_init_statement_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004998 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_004999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_var"
        "iable_from_for_init_statement_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_004999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_004999 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_"
        "variable_from_while_condition_in_outer_scope_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005000 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_v"
        "ariable_from_while_condition_in_outer_scope_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005001 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.use"
        "_parameter_names_from_function_declaration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005002 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_"
        "parameter_names_from_function_declaration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005003 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "variable_not_visible_in_own_initializer_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005004 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.v"
        "ariable_not_visible_in_own_initializer_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005005 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid."
        "local_variable_hides_function_parameter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005006 end";
}

static HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_005007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.scoping.invalid.l"
        "ocal_variable_hides_function_parameter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30005TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30005TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30005TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30005TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30005TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_005007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_005007 end";
}
