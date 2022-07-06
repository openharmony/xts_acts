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
#include "../ActsDeqpgles30008TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007091, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007091 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007091 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007091 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007092, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007092 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007092 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007092 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007093, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007093 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.basic_lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007093 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007093 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007094, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007094 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.basic_lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007094 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007094 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007095, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007095 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007095 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007095 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007096, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007096 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007096 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007096 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007097, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007097 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007097 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007097 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007098, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007098 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_c"
        "onstant_iterations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007098 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007098 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007099, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007099 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007099 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007099 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007100, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007100 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007100 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007100 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007101, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007101 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007101 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007101 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007102, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007102 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007102 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007102 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007103, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007103 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_wh"
        "ile_constant_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007103 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007103 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007104, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007104 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whi"
        "le_constant_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007104 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007104 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007105, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007105 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_i"
        "terations.infinite_with_unconditional_break_first_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007105 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007105 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007106, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007106 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_it"
        "erations.infinite_with_unconditional_break_first_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007106 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007106 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007107, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007107 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_i"
        "terations.infinite_with_unconditional_break_last_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007107 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007107 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007108, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007108 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_constant_it"
        "erations.infinite_with_unconditional_break_last_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007108 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007108 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007109, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007109 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_consta"
        "nt_iterations.infinite_with_conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007109 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007109 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007110, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007110 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_constan"
        "t_iterations.infinite_with_conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007110 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007110 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007111, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007111 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007111 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007111 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007112, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007112 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007112 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007112 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007113, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007113 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007113 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007113 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007114, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007114 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_c"
        "onstant_iterations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007114 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007114 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007115, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007115 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007115 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007115 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007116, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007116 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_c"
        "onstant_iterations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007116 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007116 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007117, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007117 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007117 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007117 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007118, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007118 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007118 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007118 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007119, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007119 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_co"
        "nstant_iterations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007119 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007119 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007120, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007120 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_con"
        "stant_iterations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007120 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007120 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007121, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007121 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_c"
        "onstant_iterations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007121 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007121 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007122, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007122 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_co"
        "nstant_iterations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007122 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007122 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007123, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007123 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_co"
        "nstant_iterations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007123 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007123 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007124, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007124 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_con"
        "stant_iterations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007124 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007124 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007125, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007125 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whi"
        "le_constant_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007125 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007125 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007126, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007126 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007126 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007126 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007127, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007127 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007127 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007127 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007128, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007128 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007128 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007128 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007129, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007129 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007129 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007129 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007130, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007130 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007130 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007130 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007131, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007131 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_"
        "constant_iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007131 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007131 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007132, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007132 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_c"
        "onstant_iterations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007132 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007132 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007133, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007133 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whi"
        "le_constant_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007133 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007133 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007134, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007134 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007134 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007134 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007135, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007135 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007135 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007135 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007136, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007136 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007136 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007136 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007137, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007137 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_c"
        "onstant_iterations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007137 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007137 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007138, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007138 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_co"
        "nstant_iterations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007138 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007138 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007139, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007139 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007139 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007139 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007140, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007140 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007140 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007140 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007141, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007141 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007141 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007141 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007142, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007142 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007142 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007142 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007143, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007143 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_w"
        "hile_constant_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007143 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007143 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007144, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007144 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_wh"
        "ile_constant_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007144 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007144 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007145, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007145 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_"
        "while_constant_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007145 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007145 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007146, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007146 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_w"
        "hile_constant_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007146 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007146 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007147, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007147 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_whil"
        "e_constant_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007147 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007147 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007148, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007148 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while"
        "_constant_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007148 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007148 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007149, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007149 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_con"
        "stant_iterations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007149 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007149 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007150, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007150 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_cons"
        "tant_iterations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007150 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007150 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007151, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007151 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_con"
        "stant_iterations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007151 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007151 end";
}

static HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007152, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007152 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.do_while_cons"
        "tant_iterations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007152 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007152 end";
}
