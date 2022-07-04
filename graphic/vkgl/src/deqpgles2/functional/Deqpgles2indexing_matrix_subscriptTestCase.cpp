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
#include "../ActsDeqpgles20004TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003211, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003211 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat2_static_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003211 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003211 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003212, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003212 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat2_static_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003212 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003212 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003213, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003213 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat2_static_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003213 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003213 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003214, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003214 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat2_static_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003214 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003214 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003215, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003215 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat2_static_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003215 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003215 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003216, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003216 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_static_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003216 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003216 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003217, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003217 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_static_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003217 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003217 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003218, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003218 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat2_static_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003218 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003218 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003219, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003219 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat2_dynamic_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003219 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003219 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003220, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003220 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat2_dynamic_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003220 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003220 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003221, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003221 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat2_dynamic_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003221 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003221 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003222, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003222 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat2_dynamic_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003222 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003222 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003223, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003223 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_dynamic_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003223 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003223 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003224, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003224 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat2_dynamic_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003224 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003224 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003225, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003225 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_dynamic_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003225 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003225 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003226, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003226 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat2_dynamic_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003226 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003226 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003227, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003227 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat2_static_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003227 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003227 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003228, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003228 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_static_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003228 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003228 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003229, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003229 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_static_loop_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003229 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003229 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003230, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003230 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat2_static_loop_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003230 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003230 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003231, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003231 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat2_static_loop_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003231 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003231 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003232, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003232 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat2_static_loop_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003232 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003232 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003233, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003233 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat2_static_loop_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003233 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003233 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003234, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003234 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat2_static_loop_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003234 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003234 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003235, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003235 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_dynamic_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003235 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003235 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003236, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003236 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat2_dynamic_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003236 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003236 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003237, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003237 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat2_dynamic_loop_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003237 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003237 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003238, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003238 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat2_dynamic_loop_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003238 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003238 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003239, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003239 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat2_dynamic_loop_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003239 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003239 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003240, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003240 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat2_dynamic_loop_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003240 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003240 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003241, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003241 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat2_dynamic_loop_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003241 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003241 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003242, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003242 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscri"
        "pt.mat2_dynamic_loop_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003242 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003242 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003243, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003243 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat3_static_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003243 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003243 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003244, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003244 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat3_static_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003244 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003244 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003245, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003245 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat3_static_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003245 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003245 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003246, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003246 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat3_static_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003246 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003246 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003247, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003247 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat3_static_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003247 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003247 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003248, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003248 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_static_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003248 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003248 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003249, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003249 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_static_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003249 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003249 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003250, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003250 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat3_static_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003250 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003250 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003251, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003251 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat3_dynamic_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003251 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003251 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003252, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003252 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat3_dynamic_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003252 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003252 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003253, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003253 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat3_dynamic_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003253 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003253 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003254, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003254 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat3_dynamic_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003254 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003254 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003255, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003255 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_dynamic_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003255 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003255 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003256, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003256 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat3_dynamic_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003256 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003256 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003257, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003257 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_dynamic_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003257 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003257 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003258, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003258 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat3_dynamic_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003258 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003258 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003259, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003259 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat3_static_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003259 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003259 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003260, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003260 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_static_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003260 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003260 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003261, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003261 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_static_loop_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003261 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003261 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003262, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003262 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat3_static_loop_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003262 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003262 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003263, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003263 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat3_static_loop_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003263 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003263 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003264, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003264 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat3_static_loop_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003264 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003264 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003265, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003265 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat3_static_loop_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003265 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003265 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003266, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003266 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat3_static_loop_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003266 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003266 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003267, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003267 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_dynamic_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003267 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003267 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003268, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003268 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat3_dynamic_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003268 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003268 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003269, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003269 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat3_dynamic_loop_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003269 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003269 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003270, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003270 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat3_dynamic_loop_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003270 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003270 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003271, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003271 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat3_dynamic_loop_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003271 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003271 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003272, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003272 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat3_dynamic_loop_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003272 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003272 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003273, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003273 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat3_dynamic_loop_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003273 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003273 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003274, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003274 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscri"
        "pt.mat3_dynamic_loop_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003274 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003274 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003275, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003275 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat4_static_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003275 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003275 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003276, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003276 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat4_static_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003276 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003276 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003277, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003277 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat4_static_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003277 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003277 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003278, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003278 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat4_static_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003278 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003278 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003279, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003279 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat4_static_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003279 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003279 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003280, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003280 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_static_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003280 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003280 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003281, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003281 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_static_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003281 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003281 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003282, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003282 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat4_static_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003282 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003282 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_"
        "subscript.mat4_dynamic_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003283 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat4_dynamic_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003284 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_s"
        "ubscript.mat4_dynamic_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003285 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat4_dynamic_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003286 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_dynamic_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003287 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat4_dynamic_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003288 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_dynamic_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003289 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat4_dynamic_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003290 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_su"
        "bscript.mat4_static_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003291 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_static_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003292 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_static_loop_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003293 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat4_static_loop_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003294 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat4_static_loop_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003295 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat4_static_loop_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003296 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat4_static_loop_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003297 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat4_static_loop_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003298 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_dynamic_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003299 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat4_dynamic_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003300 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_sub"
        "script.mat4_dynamic_loop_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003301 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subs"
        "cript.mat4_dynamic_loop_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003302 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subsc"
        "ript.mat4_dynamic_loop_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003303 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat4_dynamic_loop_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003304 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscr"
        "ipt.mat4_dynamic_loop_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003305 end";
}

static HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_003306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.indexing.matrix_subscri"
        "pt.mat4_dynamic_loop_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20004TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20004TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20004TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20004TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20004TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_003306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_003306 end";
}
