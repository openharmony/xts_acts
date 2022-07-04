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
#include "../ActsDeqpgles20009TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.lessThan_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008230 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.lessThan_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008231 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.lessThan_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008232 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.lessThan_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008233 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.lessThan_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008234 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.lessThan_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008235 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.lessThan_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008236 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.lessThan_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008237 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.lessThan_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008238 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.lessThan_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008239 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.lessThan_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008240 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.lessThan_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008241 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.lessThanEqual_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008242 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.lessThanEqual_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008243 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.lessThanEqual_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008244 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.lessThanEqual_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008245 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.lessThanEqual_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008246 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.lessThanEqual_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008247 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.lessThanEqual_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008248 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.lessThanEqual_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008249 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.lessThanEqual_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008250 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.lessThanEqual_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008251 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.lessThanEqual_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008252 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.lessThanEqual_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008253 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.greaterThan_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008254 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.greaterThan_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008255 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.greaterThan_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008256 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.greaterThan_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008257 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.greaterThan_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008258 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.greaterThan_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008259 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.greaterThan_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008260 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.greaterThan_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008261 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.greaterThan_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008262 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.greaterThan_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008263 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.greaterThan_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008264 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.built"
        "in_functions.vector_relational.greaterThan_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008265 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.greaterThanEqual_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008266 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin"
        "_functions.vector_relational.greaterThanEqual_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008267 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.greaterThanEqual_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008268 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin"
        "_functions.vector_relational.greaterThanEqual_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008269 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builti"
        "n_functions.vector_relational.greaterThanEqual_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008270 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin"
        "_functions.vector_relational.greaterThanEqual_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008271 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin"
        "_functions.vector_relational.greaterThanEqual_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008272 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin_"
        "functions.vector_relational.greaterThanEqual_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008273 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin"
        "_functions.vector_relational.greaterThanEqual_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008274 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin_"
        "functions.vector_relational.greaterThanEqual_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008275 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin"
        "_functions.vector_relational.greaterThanEqual_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008276 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin_"
        "functions.vector_relational.greaterThanEqual_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008277 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008278 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008279 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008280 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008281 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008282 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008283 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008284 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008285 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008286 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008287 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008288 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008289 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008290 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008291 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008292 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008293 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.equal_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008294 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.equal_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008295 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.notEqual_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008296 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008297 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.notEqual_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008298 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008299 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bu"
        "iltin_functions.vector_relational.notEqual_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008300 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008301 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008302 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.notEqual_ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008303 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008304 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.notEqual_ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008305 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008306 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.notEqual_ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008307 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008308 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.notEqual_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008309 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008310 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.notEqual_bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008311 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.bui"
        "ltin_functions.vector_relational.notEqual_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008312 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.buil"
        "tin_functions.vector_relational.notEqual_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008313 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.any_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008314 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.any_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008315 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.any_bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008316 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.any_bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008317 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.any_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008318 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.any_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008319 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.all_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008320 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.all_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008321 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.all_bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008322 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.all_bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008323 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.all_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008324 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.all_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008325 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.not_bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008326 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.not_bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008327 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.not_bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008328 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.not_bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008329 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions."
        "builtin_functions.vector_relational.not_bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008330 end";
}

static HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_008331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.constant_expressions.b"
        "uiltin_functions.vector_relational.not_bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20009TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20009TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20009TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20009TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20009TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_008331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_008331 end";
}
