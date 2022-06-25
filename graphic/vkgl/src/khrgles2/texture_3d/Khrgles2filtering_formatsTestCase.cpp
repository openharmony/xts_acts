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

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000015, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest",
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
            "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000016, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.filtering.formats.rgba8_linear",
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
            "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000017, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_nearest start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_nearest",
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
            "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_nearest notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_nearest end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000018, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_nearest start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_nearest",
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
            "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_nearest notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_nearest end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000019, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_linear",
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
            "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_linear notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_nearest_mipmap_linear end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000020, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_linear start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_linear",
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
            "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_linear notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.filtering.formats.rgba8_linear_mipmap_linear end";
}
