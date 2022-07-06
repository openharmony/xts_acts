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
#include "../ActsDeqpgles30037TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036691, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036691 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036691 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036691 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036692, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036692 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036692 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036692 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036693, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036693 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036693 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036693 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036694, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036694 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036694 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036694 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036695, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036695 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036695 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036695 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036696, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036696 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.vec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036696 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036696 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036697, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036697 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036697 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036697 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036698, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036698 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036698 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036698 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036699, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036699 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.vec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036699 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036699 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036700, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036700 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036700 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036700 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036701, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036701 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036701 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036701 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036702, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036702 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036702 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036702 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036703, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036703 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036703 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036703 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036704, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036704 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036704 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036704 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036705, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036705 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036705 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036705 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036706, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036706 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat2x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036706 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036706 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036707, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036707 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.mat2x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036707 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036707 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036708, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036708 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat2x3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036708 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036708 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036709, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036709 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat2x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036709 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036709 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036710, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036710 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.mat2x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036710 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036710 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036711, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036711 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat2x4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036711 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036711 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036712, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036712 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat3x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036712 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036712 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036713, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036713 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.mat3x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036713 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036713 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036714, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036714 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat3x2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036714 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036714 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036715, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036715 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036715 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036715 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036716, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036716 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036716 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036716 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036717, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036717 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.mat3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036717 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036717 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036718, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036718 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat3x4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036718 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036718 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036719, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036719 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.mat3x4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036719 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036719 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036720, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036720 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat3x4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036720 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036720 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036721, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036721 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat4x2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036721 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036721 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036722, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036722 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.mat4x2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036722 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036722 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036723, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036723 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat4x2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036723 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036723 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036724, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036724 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat4x3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036724 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036724 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036725, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036725 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.mat4x3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036725 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036725 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036726, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036726 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat4x3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036726 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036726 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036727, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036727 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036727 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036727 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036728, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036728 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036728 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036728 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036729, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036729 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.mat4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036729 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036729 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036730, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036730 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036730 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036730 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036731, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036731 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036731 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036731 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036732, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036732 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.i"
        "nfo_query.consistency.basic.int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036732 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036732 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036733, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036733 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036733 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036733 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036734, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036734 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036734 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036734 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036735, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036735 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.ivec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036735 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036735 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036736, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036736 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036736 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036736 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036737, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036737 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036737 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036737 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036738, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036738 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.ivec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036738 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036738 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036739, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036739 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036739 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036739 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036740, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036740 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036740 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036740 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036741, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036741 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036741 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036741 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036742, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036742 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.uint_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036742 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036742 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036743, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036743 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.uint_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036743 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036743 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036744, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036744 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.uint_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036744 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036744 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036745, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036745 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.uvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036745 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036745 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036746, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036746 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.uvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036746 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036746 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036747, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036747 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.uvec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036747 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036747 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036748, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036748 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.uvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036748 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036748 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036749, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036749 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.uvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036749 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036749 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036750, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036750 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.uvec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036750 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036750 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036751, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036751 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.uvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036751 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036751 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036752, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036752 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.uvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036752 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036752 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036753, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036753 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.uvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036753 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036753 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036754, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036754 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036754 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036754 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036755, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036755 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036755 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036755 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036756, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036756 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.bool_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036756 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036756 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036757, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036757 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036757 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036757 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036758, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036758 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036758 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036758 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036759, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036759 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.bvec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036759 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036759 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036760, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036760 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036760 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036760 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036761, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036761 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036761 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036761 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036762, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036762 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.bvec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036762 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036762 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036763, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036763 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.inf"
        "o_query.consistency.basic.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036763 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036763 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036764, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036764 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036764 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036764 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036765, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036765 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.in"
        "fo_query.consistency.basic.bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036765 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036765 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036766, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036766 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.sampler2D_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036766 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036766 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036767, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036767 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_q"
        "uery.consistency.basic.sampler2D_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036767 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036767 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036768, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036768 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info"
        "_query.consistency.basic.sampler2D_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036768 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036768 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036769, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036769 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_q"
        "uery.consistency.basic.samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036769 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036769 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036770, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036770 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_qu"
        "ery.consistency.basic.samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036770 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036770 end";
}

static HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036771, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_036771 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES3.functional.uniform_api.info_"
        "query.consistency.basic.samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles30037TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles30037TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles30037TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles30037TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles30037TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_036771 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_036771 end";
}
