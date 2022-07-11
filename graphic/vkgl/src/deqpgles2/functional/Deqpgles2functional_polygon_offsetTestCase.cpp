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

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016303, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016303 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.pol"
        "ygon_offset.default_enable",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016303 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016303 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016304, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016304 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.polygon_offs"
        "et.default_displacement_with_units",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016304 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016304 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016305, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016305 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.polygon_o"
        "ffset.default_render_with_factor",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016305 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016305 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016306, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016306 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.polygon"
        "_offset.default_factor_0_slope",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016306 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016306 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016307, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016307 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.pol"
        "ygon_offset.fixed16_enable",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016307 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016307 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016308, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016308 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.polygon_offs"
        "et.fixed16_displacement_with_units",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016308 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016308 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016309, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016309 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.polygon_o"
        "ffset.fixed16_render_with_factor",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016309 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016309 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016310, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016310 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.polygon"
        "_offset.fixed16_factor_0_slope",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016310 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016310 end";
}
