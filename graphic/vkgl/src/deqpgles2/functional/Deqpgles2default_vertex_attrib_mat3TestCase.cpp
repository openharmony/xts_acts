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

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016445, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016445 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.default_ve"
        "rtex_attrib.mat3.vertex_attrib_1f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016445 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016445 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016446, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016446 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.default_ve"
        "rtex_attrib.mat3.vertex_attrib_4f",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016446 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016446 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016447, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016447 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.default_ver"
        "tex_attrib.mat3.vertex_attrib_1fv",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016447 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016447 end";
}

static HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016448, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_016448 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.default_ver"
        "tex_attrib.mat3.vertex_attrib_4fv",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20017TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20017TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20017TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20017TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20017TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_016448 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_016448 end";
}
