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

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000378, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.copy_sub_image.rgba start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.copy_sub_image.rgba",
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
            "KHR-GLES2.texture_3d.copy_sub_image.rgba notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.copy_sub_image.rgba end";
}

static HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000379, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.copy_sub_image.negative start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case=KHR-GLES2.texture_3d.copy_sub_image.negative",
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
            "KHR-GLES2.texture_3d.copy_sub_image.negative notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    }
    GTEST_LOG_(INFO) <<
        "KHR-GLES2.texture_3d.copy_sub_image.negative end";
}
