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

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscrip"
        "t.mat4x2_static_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000291 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4x2_static_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000292 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x2_static_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000293 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x2_static_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000294 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript.m"
        "at4x2_static_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000295 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscri"
        "pt.mat4x2_dynamic_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000296 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscrip"
        "t.mat4x2_dynamic_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000297 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4x2_static_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000298 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x2_static_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000299 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x2_dynamic_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000300 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript.m"
        "at4x2_dynamic_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000301 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscri"
        "pt.mat4x3_static_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000302 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscrip"
        "t.mat4x3_static_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000303 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4x3_static_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000304 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x3_static_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000305 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x3_static_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000306 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript.m"
        "at4x3_static_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000307 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscri"
        "pt.mat4x3_dynamic_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000308 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscrip"
        "t.mat4x3_dynamic_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000309 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4x3_static_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000310 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000311, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000311 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x3_static_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000311 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000311 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000312, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000312 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4x3_dynamic_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000312 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000312 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000313, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000313 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript.m"
        "at4x3_dynamic_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000313 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000313 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000314, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000314 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscr"
        "ipt.mat4_static_write_dynamic_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000314 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000314 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000315, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000315 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscri"
        "pt.mat4_static_write_dynamic_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000315 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000315 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000316, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000316 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscrip"
        "t.mat4_static_write_static_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000316 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000316 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4_static_write_static_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000317 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4_static_write_dynamic_loop_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000318 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4_static_write_dynamic_loop_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000319 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000320, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000320 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscr"
        "ipt.mat4_dynamic_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000320 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000320 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000321, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000321 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscri"
        "pt.mat4_dynamic_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000321 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000321 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000322, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000322 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscrip"
        "t.mat4_static_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000322 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000322 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000323, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000323 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4_static_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000323 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000323 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000324, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000324 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript"
        ".mat4_dynamic_loop_write_static_read_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000324 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000324 end";
}

static HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000325, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000325 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.indexing.matrix_subscript."
        "mat4_dynamic_loop_write_static_read_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000325 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000325 end";
}
