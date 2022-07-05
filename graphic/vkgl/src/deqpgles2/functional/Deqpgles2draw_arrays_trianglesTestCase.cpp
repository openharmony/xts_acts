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
#include "../ActsDeqpgles20017TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016317, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016317 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.draw.draw_"
        "arrays.triangles.single_attribute",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016317 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016317 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016318, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016318 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.draw.draw_ar"
        "rays.triangles.multiple_attributes",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016318 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016318 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016319, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016319 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.draw.draw_a"
        "rrays.triangles.default_attribute",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016319 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016319 end";
}
