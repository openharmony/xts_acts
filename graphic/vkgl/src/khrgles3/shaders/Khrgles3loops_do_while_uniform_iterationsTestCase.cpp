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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uni"
        "form_iterations.basic_lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000758 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.basic_lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000759 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.basic_mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000760 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.basic_mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000761 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000762, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000762 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.basic_mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000762 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000762 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000763, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000763 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform"
        "_iterations.basic_mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000763 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000763 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.basic_highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000764 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.basic_highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000765 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.basic_highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000766 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.basic_highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000767 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_u"
        "niform_iterations.empty_body_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000768 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_un"
        "iform_iterations.empty_body_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000769 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_iteratio"
        "ns.infinite_with_unconditional_break_first_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000770 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_iteration"
        "s.infinite_with_unconditional_break_first_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000771 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000772, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000772 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_iterati"
        "ons.infinite_with_unconditional_break_last_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000772 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000772 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000773, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000773 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_iteratio"
        "ns.infinite_with_unconditional_break_last_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000773 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000773 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000774, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000774 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_iter"
        "ations.infinite_with_conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000774 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000774 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000775, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000775 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_itera"
        "tions.infinite_with_conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000775 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000775 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000776, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000776 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.single_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000776 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000776 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000777, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000777 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.single_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000777 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000777 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000778, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000778 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.compound_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000778 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000778 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000779, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000779 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.compound_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000779 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000779 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000780, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000780 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.sequence_statement_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000780 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000780 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000781, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000781 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.sequence_statement_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000781 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000781 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000782, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000782 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.single_iteration_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000782 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000782 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000783, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000783 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.single_iteration_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000783 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000783 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform"
        "_iterations.select_iteration_count_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000784 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_"
        "iterations.select_iteration_count_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000785 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.conditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000786 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform"
        "_iterations.conditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000787 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform"
        "_iterations.unconditional_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000788 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_"
        "iterations.unconditional_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000789 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uni"
        "form_iterations.only_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000790 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.only_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000791 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.double_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000792 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.double_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000793 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.conditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000794 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.conditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000795 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.unconditional_break_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000796 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform"
        "_iterations.unconditional_break_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000797 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uni"
        "form_iterations.pre_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000798 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.pre_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000799 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uni"
        "form_iterations.post_increment_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000800 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.post_increment_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000801 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifor"
        "m_iterations.mixed_break_continue_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000802 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform"
        "_iterations.mixed_break_continue_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000803 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uni"
        "form_iterations.vector_counter_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000804 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.vector_counter_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000805 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000806, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000806 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uni"
        "form_iterations.101_iterations_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000806 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000806 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000807, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000807 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.101_iterations_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000807 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000807 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000808, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000808 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_"
        "uniform_iterations.sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000808 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000808 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000809, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000809 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_u"
        "niform_iterations.sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000809 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000809 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000810, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000810 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while"
        "_uniform_iterations.nested_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000810 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000810 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000811, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000811 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_"
        "uniform_iterations.nested_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000811 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000811 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000812, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000812 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unif"
        "orm_iterations.nested_sequence_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000812 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000812 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000813, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000813 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_unifo"
        "rm_iterations.nested_sequence_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000813 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000813 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000814, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000814 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_"
        "iterations.nested_tricky_dataflow_1_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000814 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000814 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000815, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000815 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_i"
        "terations.nested_tricky_dataflow_1_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000815 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000815 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000816, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000816 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_"
        "iterations.nested_tricky_dataflow_2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000816 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000816 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000817, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000817 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.loops.do_while_uniform_i"
        "terations.nested_tricky_dataflow_2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000817 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000817 end";
}
