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

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions"
        ".vector_combine.float_bool_to_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001247 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions."
        "vector_combine.float_bool_to_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001248 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions"
        ".vector_combine.float_bool_to_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001249 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions."
        "vector_combine.float_bool_to_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001250 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.vector_combine.int_bool_to_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001251 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions"
        ".vector_combine.int_bool_to_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001252 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.vector_combine.int_bool_to_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001253 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions"
        ".vector_combine.int_bool_to_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001254 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversion"
        "s.vector_combine.int_bool_to_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001255 end";
}

static HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.conversions"
        ".vector_combine.int_bool_to_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20002TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20002TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001256 end";
}
