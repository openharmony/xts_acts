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

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002283, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002283 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.0",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002283 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002283 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002284, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002284 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.1",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002284 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002284 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002285, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002285 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.2",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002285 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002285 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002286, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002286 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.3",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002286 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002286 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002287, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002287 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.4",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002287 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002287 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002288, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002288 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.5",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002288 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002288 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002289, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002289 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.6",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002289 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002289 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002290, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002290 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.7",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002290 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002290 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002291, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002291 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.8",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002291 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002291 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002292, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002292 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.9",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002292 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002292 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002293, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002293 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.10",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002293 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002293 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002294, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002294 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.11",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002294 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002294 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002295, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002295 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.12",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002295 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002295 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002296, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002296 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.13",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002296 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002296 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002297, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002297 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.14",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002297 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002297 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002298, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002298 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.15",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002298 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002298 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002299, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002299 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.16",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002299 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002299 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002300, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002300 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.17",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002300 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002300 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002301, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002301 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.18",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002301 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002301 end";
}

static HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002302, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_002302 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_blo"
        "ck.random.all_shared_buffer.19",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30003TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30003TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30003TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30003TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30003TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_002302 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_002302 end";
}
