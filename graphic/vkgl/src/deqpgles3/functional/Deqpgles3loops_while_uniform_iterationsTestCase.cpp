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
#include "../ActsDeqpgles30007TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006963, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006963 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006963 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006963 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006964, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006964 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006964 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006964 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006965, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006965 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.basic_lowp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006965 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006965 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006966, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006966 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.basic_lowp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006966 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006966 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006967, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006967 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006967 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006967 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006968, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006968 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006968 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006968 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006969, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006969 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006969 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006969 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006970, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006970 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_un"
        "iform_iterations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006970 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006970 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006971, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006971 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006971 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006971 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006972, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006972 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006972 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006972 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006973, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006973 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006973 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006973 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006974, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006974 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006974 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006974 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006975, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006975 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.whi"
        "le_uniform_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006975 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006975 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006976, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006976 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.whil"
        "e_uniform_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006976 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006976 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uniform_ite"
        "rations.infinite_with_unconditional_break_first_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006977 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uniform_iter"
        "ations.infinite_with_unconditional_break_first_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006978 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uniform_ite"
        "rations.infinite_with_unconditional_break_last_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006979 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uniform_iter"
        "ations.infinite_with_unconditional_break_last_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006980 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uniform"
        "_iterations.infinite_with_conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006981 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uniform_"
        "iterations.infinite_with_conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006982 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006983 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006984 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006985 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006986, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006986 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_un"
        "iform_iterations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006986 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006986 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006987, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006987 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006987 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006987 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006988, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006988 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_un"
        "iform_iterations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006988 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006988 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006989, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006989 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.whil"
        "e_uniform_iterations.no_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006989 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006989 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006990, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006990 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.no_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006990 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006990 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006991, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006991 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006991 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006991 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006992, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006992 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006992 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006992 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006993, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006993 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uni"
        "form_iterations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006993 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006993 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006994, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006994 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_unif"
        "orm_iterations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006994 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006994 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006995, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006995 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_un"
        "iform_iterations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006995 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006995 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006996, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006996 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uni"
        "form_iterations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006996 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006996 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006997, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006997 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uni"
        "form_iterations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006997 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006997 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006998, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006998 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_unif"
        "orm_iterations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006998 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006998 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006999, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006999 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.whil"
        "e_uniform_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006999 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006999 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007000, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007000 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007000 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007000 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007001, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007001 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007001 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007001 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007002, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007002 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007002 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007002 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007003 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007003 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007003 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007004 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007004 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007004 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007005 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_u"
        "niform_iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007005 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007005 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007006 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_un"
        "iform_iterations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007006 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007006 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007007 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.whil"
        "e_uniform_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007007 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007007 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007008 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007008 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007008 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007009 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007009 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007009 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007010 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007010 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007010 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007011 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_un"
        "iform_iterations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007011 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007011 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007012 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_uni"
        "form_iterations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007012 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007012 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007013 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007013 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007013 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007014 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007014 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007014 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007015 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007015 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007015 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007016 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007016 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007016 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007017 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.wh"
        "ile_uniform_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007017 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007017 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007018 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.whi"
        "le_uniform_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007018 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007018 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007019 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.w"
        "hile_uniform_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007019 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007019 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007020 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.wh"
        "ile_uniform_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007020 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007020 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007021, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007021 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while"
        "_uniform_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007021 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007021 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007022, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007022 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_"
        "uniform_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007022 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007022 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007023, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007023 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_unif"
        "orm_iterations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007023 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007023 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007024, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007024 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_unifo"
        "rm_iterations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007024 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007024 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007025, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007025 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_unif"
        "orm_iterations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007025 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007025 end";
}

static HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007026, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007026 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.loops.while_unifo"
        "rm_iterations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007026 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007026 end";
}
