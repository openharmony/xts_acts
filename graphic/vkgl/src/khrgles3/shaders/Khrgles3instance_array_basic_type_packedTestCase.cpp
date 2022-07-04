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
#include "../ActsKhrgles30003TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002047, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002047 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.float",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002047 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002047 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002048, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002048 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.vec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002048 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002048 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002049, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002049 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.vec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002049 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002049 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002050, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002050 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.vec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002050 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002050 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002051, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002051 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.int",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002051 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002051 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002052, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002052 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.ivec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002052 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002052 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002053, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002053 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.ivec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002053 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002053 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002054, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002054 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.ivec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002054 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002054 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002055, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002055 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.uint",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002055 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002055 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002056, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002056 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.uvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002056 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002056 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002057, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002057 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.uvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002057 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002057 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002058, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002058 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.uvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002058 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002058 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002059, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002059 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.bool",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002059 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002059 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002060, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002060 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.bvec2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002060 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002060 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002061, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002061 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.bvec3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002061 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002061 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002062, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002062 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.bvec4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002062 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002062 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002063, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002063 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002063 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002063 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002064, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002064 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instanc"
        "e_array_basic_type.packed.row_major_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002064 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002064 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002065, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002065 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_"
        "array_basic_type.packed.column_major_mat2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002065 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002065 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002066, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002066 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002066 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002066 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002067, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002067 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instanc"
        "e_array_basic_type.packed.row_major_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002067 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002067 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002068, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002068 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_"
        "array_basic_type.packed.column_major_mat3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002068 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002068 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002069, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002069 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.in"
        "stance_array_basic_type.packed.mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002069 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002069 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instanc"
        "e_array_basic_type.packed.row_major_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002070 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_"
        "array_basic_type.packed.column_major_mat4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002071 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002072, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002072 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002072 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002072 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002073, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002073 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance"
        "_array_basic_type.packed.row_major_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002073 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002073 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002074, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002074 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_a"
        "rray_basic_type.packed.column_major_mat2x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002074 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002074 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002075, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002075 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.mat2x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002075 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002075 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002076, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002076 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance"
        "_array_basic_type.packed.row_major_mat2x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002076 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002076 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002077, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002077 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_a"
        "rray_basic_type.packed.column_major_mat2x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002077 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002077 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002078, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002078 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.mat3x2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002078 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002078 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002079, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002079 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance"
        "_array_basic_type.packed.row_major_mat3x2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002079 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002079 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002080, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002080 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_a"
        "rray_basic_type.packed.column_major_mat3x2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002080 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002080 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002081, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002081 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.mat3x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002081 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002081 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002082, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002082 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance"
        "_array_basic_type.packed.row_major_mat3x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002082 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002082 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002083, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002083 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_a"
        "rray_basic_type.packed.column_major_mat3x4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002083 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002083 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002084, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002084 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.mat4x2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002084 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002084 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002085, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002085 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance"
        "_array_basic_type.packed.row_major_mat4x2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002085 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002085 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002086, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002086 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_a"
        "rray_basic_type.packed.column_major_mat4x2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002086 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002086 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002087, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002087 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.ins"
        "tance_array_basic_type.packed.mat4x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002087 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002087 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002088, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002088 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance"
        "_array_basic_type.packed.row_major_mat4x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002088 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002088 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002089, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002089 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.instance_a"
        "rray_basic_type.packed.column_major_mat4x3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002089 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002089 end";
}
