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
#include "../ActsDeqpgles20007TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006464, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006464 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.mediump_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006464 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006464 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006465, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006465 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.g"
        "eometric.normalize.mediump_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006465 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006465 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006466, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006466 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".geometric.normalize.highp_float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006466 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006466 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006467, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006467 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.highp_float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006467 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006467 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006468, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006468 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.mediump_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006468 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006468 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006469, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006469 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.g"
        "eometric.normalize.mediump_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006469 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006469 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006470, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006470 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".geometric.normalize.highp_vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006470 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006470 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006471, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006471 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.highp_vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006471 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006471 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006472, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006472 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.mediump_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006472 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006472 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006473, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006473 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.g"
        "eometric.normalize.mediump_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006473 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006473 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006474, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006474 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".geometric.normalize.highp_vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006474 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006474 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006475, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006475 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.highp_vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006475 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006475 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006476, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006476 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.mediump_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006476 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006476 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006477, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006477 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator.g"
        "eometric.normalize.mediump_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006477 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006477 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006478, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006478 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator"
        ".geometric.normalize.highp_vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006478 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006478 end";
}

static HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006479, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_006479 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.operator."
        "geometric.normalize.highp_vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20007TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20007TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20007TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20007TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20007TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_006479 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_006479 end";
}
