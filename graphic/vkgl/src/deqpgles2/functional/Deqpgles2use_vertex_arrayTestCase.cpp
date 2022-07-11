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
#include "../ActsDeqpgles20001TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000070, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000070 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.buffer"
        ".write.use.vertex_array.array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000070 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000070 end";
}

static HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000071, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_000071 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "dEQP-GLES2.functional.buffer.wri"
        "te.use.vertex_array.element_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsDeqpgles20001TestSuite::runResult.numPassed += result.numPassed;
    ActsDeqpgles20001TestSuite::runResult.numFailed += result.numFailed;
    ActsDeqpgles20001TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsDeqpgles20001TestSuite::runResult.numWarnings += result.numWarnings;
    ActsDeqpgles20001TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_000071 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_000071 end";
}
