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

#include <climits>
#include <gtest/gtest.h>
#include "../Khrgles2BaseFunc.hpp"
#include "../ActsKhrgles20001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000003, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_float_vert start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.sin_float_vert",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.sin_float_vert notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_float_vert end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000004, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_float_frag start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.sin_float_frag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.sin_float_frag notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_float_frag end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000005, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_vert start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_vert",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_vert notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_vert end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000006, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_frag start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_frag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_frag notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec2_frag end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000007, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_vert start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_vert",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_vert notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_vert end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000008, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_frag start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_frag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_frag notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.sin_vec3_frag end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000009, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_float_vert start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.cos_float_vert",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.cos_float_vert notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_float_vert end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000010, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_float_frag start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.cos_float_frag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.cos_float_frag notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_float_frag end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000011, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_vert start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_vert",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_vert notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_vert end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000012, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_frag start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_frag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_frag notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec2_frag end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000013, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_vert start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_vert",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_vert notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_vert end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000014, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_frag start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_frag",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) <<
            "KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_frag notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.shaders.aggressive_optimizations.cos_vec3_frag end";
}
