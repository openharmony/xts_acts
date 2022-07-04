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
#include "../ActsDeqpgles20015TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014309 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014310 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014311 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014312 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014313 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.vec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014314 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014315 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014316 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.vec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014317 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014318 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014319 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014320 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014321 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014322 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014323 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014324 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014325 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014326, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014326 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.mat3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014326 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014326 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014327, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014327 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014327 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014327 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014328, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014328 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014328 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014328 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014329, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014329 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.mat4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014329 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014329 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014330, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014330 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014330 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014330 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014331, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014331 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.int_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014331 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014331 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014332, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014332 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api."
        "value.initial.render.basic.int_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014332 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014332 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014333, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014333 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.ivec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014333 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014333 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014334, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014334 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.ivec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014334 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014334 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014335, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014335 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.ivec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014335 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014335 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014336, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014336 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.ivec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014336 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014336 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014337, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014337 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.ivec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014337 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014337 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014338, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014338 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.ivec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014338 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014338 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014339, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014339 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.ivec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014339 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014339 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014340, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014340 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.ivec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014340 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014340 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014341, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014341 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.ivec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014341 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014341 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014342, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014342 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.bool_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014342 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014342 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014343, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014343 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.bool_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014343 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014343 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014344, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014344 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.bool_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014344 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014344 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014345, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014345 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.bvec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014345 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014345 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014346, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014346 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.bvec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014346 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014346 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014347, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014347 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.bvec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014347 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014347 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014348, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014348 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.bvec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014348 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014348 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014349, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014349 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.bvec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014349 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014349 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014350, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014350 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.bvec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014350 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014350 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014351, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014351 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.va"
        "lue.initial.render.basic.bvec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014351 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014351 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014352, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014352 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.bvec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014352 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014352 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014353, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014353 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.v"
        "alue.initial.render.basic.bvec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014353 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014353 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014354, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014354 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.valu"
        "e.initial.render.basic.sampler2D_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014354 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014354 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014355, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014355 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value"
        ".initial.render.basic.sampler2D_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014355 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014355 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014356, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014356 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.val"
        "ue.initial.render.basic.sampler2D_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014356 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014356 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014357, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014357 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value"
        ".initial.render.basic.samplerCube_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014357 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014357 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014358, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014358 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value."
        "initial.render.basic.samplerCube_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014358 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014358 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014359, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014359 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.valu"
        "e.initial.render.basic.samplerCube_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014359 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014359 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014629, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014629 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.float_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014629 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014629 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014630, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014630 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.float_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014630 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014630 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014631, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014631 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.float_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014631 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014631 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014632, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014632 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.vec2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014632 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014632 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014633, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014633 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.vec2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014633 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014633 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014634, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014634 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.vec2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014634 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014634 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014635, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014635 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.vec3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014635 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014635 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014636, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014636 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.vec3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014636 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014636 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014637, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014637 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.vec3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014637 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014637 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014638, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014638 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.vec4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014638 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014638 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014639, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014639 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.vec4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014639 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014639 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014640, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014640 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.vec4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014640 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014640 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014641, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014641 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.mat2_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014641 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014641 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014642, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014642 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.mat2_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014642 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014642 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014643, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014643 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.mat2_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014643 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014643 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014644, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014644 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.mat3_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014644 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014644 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014645, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014645 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.mat3_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014645 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014645 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014646, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014646 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.mat3_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014646 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014646 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014647, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014647 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.as"
        "signed.by_pointer.render.basic.mat4_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014647 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014647 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014648, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014648 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.ass"
        "igned.by_pointer.render.basic.mat4_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014648 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014648 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014649, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014649 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.mat4_both",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014649 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014649 end";
}

static HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014650, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_014650 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.uniform_api.value.a"
        "ssigned.by_pointer.render.basic.int_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20015TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20015TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20015TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20015TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20015TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_014650 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_014650 end";
}
