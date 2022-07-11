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
#include "../ActsDeqpgles20014TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013863, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013863 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative"
        "_api.vertex_array.vertex_attrib",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013863 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013863 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013864, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013864 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_"
        "api.vertex_array.vertex_attribv",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013864 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013864 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013865, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013865 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api"
        ".vertex_array.vertex_attrib_pointer",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013865 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013865 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013866, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013866 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api.ve"
        "rtex_array.enable_vertex_attrib_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013866 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013866 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013867, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013867 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api.ve"
        "rtex_array.disable_vertex_attrib_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013867 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013867 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013868, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013868 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negativ"
        "e_api.vertex_array.draw_arrays",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013868 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013868 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013869, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013869 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api.ve"
        "rtex_array.draw_arrays_invalid_program",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013869 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013869 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013870, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013870 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api.verte"
        "x_array.draw_arrays_incomplete_primitive",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013870 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013870 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013871, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013871 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative"
        "_api.vertex_array.draw_elements",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013871 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013871 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013872, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013872 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api.ver"
        "tex_array.draw_elements_invalid_program",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013872 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013872 end";
}

static HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013873, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_013873 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.negative_api.vertex"
        "_array.draw_elements_incomplete_primitive",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20014TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20014TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20014TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20014TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20014TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_013873 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_013873 end";
}
