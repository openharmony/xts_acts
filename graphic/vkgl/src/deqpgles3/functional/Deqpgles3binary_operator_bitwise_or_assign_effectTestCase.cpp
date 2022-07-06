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
#include "../ActsDeqpgles30011TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_o"
        "perator.bitwise_or_assign_effect.lowp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010232 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010233 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.mediump_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010234 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010235 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010236 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010237 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010238 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.mediump_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010239 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010240 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010241 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010242 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.mediump_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010243 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010244 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010245 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010246 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.mediump_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010247 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.highp_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010248 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010249 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010250 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.highp_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010251 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010252 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.highp_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010253 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010254 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.highp_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010255 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010256 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010257 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.mediump_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010258 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010259 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010260 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010261 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010262 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.mediump_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010263 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010264 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010265 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010266 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.mediump_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010267 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.lowp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010268 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.lowp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010269 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.mediump_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010270 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.mediump_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010271 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_op"
        "erator.bitwise_or_assign_effect.highp_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010272 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010273 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010274 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.highp_uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010275 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010276 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.highp_uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010277 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_ope"
        "rator.bitwise_or_assign_effect.highp_uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010278 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.highp_uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010279 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.lowp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010280 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.lowp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010281 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.mediump_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010282 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_or_assign_effect.mediump_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010283 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.lowp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010284 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.lowp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010285 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.mediump_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010286 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_or_assign_effect.mediump_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010287 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_oper"
        "ator.bitwise_or_assign_effect.lowp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010288 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.lowp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010289 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.mediump_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010290 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_or_assign_effect.mediump_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010291 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.highp_ivec2_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010292 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.highp_ivec2_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010293 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.highp_ivec3_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010294 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.highp_ivec3_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010295 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.highp_ivec4_int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010296 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.highp_ivec4_int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010297 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.lowp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010298 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.lowp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010299 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.mediump_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010300 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_or_assign_effect.mediump_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010301 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.lowp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010302 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.lowp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010303 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.mediump_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010304 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_or_assign_effect.mediump_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010305 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.lowp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010306 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.lowp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010307 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.mediump_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010308 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operato"
        "r.bitwise_or_assign_effect.mediump_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010309 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.highp_uvec2_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010310 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.highp_uvec2_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010311 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.highp_uvec3_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010312 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.highp_uvec3_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010313 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_opera"
        "tor.bitwise_or_assign_effect.highp_uvec4_uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010314 end";
}

static HWTEST_F(ActsDeqpgles30011TestSuite, TestCase_010315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_010315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.shaders.operator.binary_operat"
        "or.bitwise_or_assign_effect.highp_uvec4_uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30011TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30011TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30011TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30011TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30011TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_010315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_010315 end";
}
