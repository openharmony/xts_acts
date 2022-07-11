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
#include "../ActsDeqpgles20008TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007784, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007784 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builti"
        "n_variable.max_vertex_attribs_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007784 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007784 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007785, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007785 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin"
        "_variable.max_vertex_attribs_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007785 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007785 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007786, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007786 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_va"
        "riable.max_vertex_uniform_vectors_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007786 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007786 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007787, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007787 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_var"
        "iable.max_vertex_uniform_vectors_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007787 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007787 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007788, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007788 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_var"
        "iable.max_fragment_uniform_vectors_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007788 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007788 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007789, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007789 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_vari"
        "able.max_fragment_uniform_vectors_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007789 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007789 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007790, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007790 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builti"
        "n_variable.max_varying_vectors_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007790 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007790 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007791, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007791 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin"
        "_variable.max_varying_vectors_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007791 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007791 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007792, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007792 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_"
        "variable.max_texture_image_units_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007792 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007792 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007793, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007793 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_v"
        "ariable.max_texture_image_units_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007793 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007793 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007794, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007794 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_vari"
        "able.max_vertex_texture_image_units_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007794 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007794 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007795, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007795 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_varia"
        "ble.max_vertex_texture_image_units_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007795 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007795 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007796, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007796 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_varia"
        "ble.max_combined_texture_image_units_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007796 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007796 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007797, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007797 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builtin_variab"
        "le.max_combined_texture_image_units_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007797 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007797 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007798, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007798 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.built"
        "in_variable.max_draw_buffers_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007798 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007798 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007799, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007799 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.builti"
        "n_variable.max_draw_buffers_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007799 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007799 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007800, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007800 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.bu"
        "iltin_variable.depth_range_vertex",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007800 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007800 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007801, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007801 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders.bui"
        "ltin_variable.depth_range_fragment",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007801 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007801 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007802, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007802 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders."
        "builtin_variable.fragcoord_xyz",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007802 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007802 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007803, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007803 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".builtin_variable.fragcoord_w",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007803 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007803 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007804, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007804 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shader"
        "s.builtin_variable.pointcoord",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007804 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007804 end";
}

static HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007805, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_007805 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.shaders"
        ".builtin_variable.frontfacing",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20008TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20008TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20008TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20008TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20008TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_007805 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_007805 end";
}
