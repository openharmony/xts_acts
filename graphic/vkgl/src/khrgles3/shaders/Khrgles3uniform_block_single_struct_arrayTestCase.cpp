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
#include "../ActsKhrgles30002TestSuite.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001977, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001977 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.singl"
        "e_struct_array.per_block_buffer_shared",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001977 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001977 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001978, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001978 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_struct"
        "_array.per_block_buffer_shared_instance_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001978 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001978 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001979, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001979 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.singl"
        "e_struct_array.per_block_buffer_packed",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001979 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001979 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001980, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001980 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_struct"
        "_array.per_block_buffer_packed_instance_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001980 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001980 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001981, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001981 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.singl"
        "e_struct_array.per_block_buffer_std140",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001981 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001981 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001982, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001982 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_struct"
        "_array.per_block_buffer_std140_instance_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001982 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001982 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001983, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001983 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_stru"
        "ct_array.single_buffer_shared_instance_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001983 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001983 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001984, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001984 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_stru"
        "ct_array.single_buffer_packed_instance_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001984 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001984 end";
}

static HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001985, Function | MediumTest | Level2)
{
    GTEST_LOG_(INFO) << "TestCase_001985 start";
    int argc = 3;
    const char *argv[3] = {
        ".",
        "--deqp-case="
        "KHR-GLES3.shaders.uniform_block.single_stru"
        "ct_array.single_buffer_std140_instance_array",
        "--deqp-archive-dir=/data/local/tmp/"
    };
    
    FuncRunResult result = RunTestKHRGLES(argc, argv);
    ActsKhrgles30002TestSuite::runResult.numPassed += result.numPassed;
    ActsKhrgles30002TestSuite::runResult.numFailed += result.numFailed;
    ActsKhrgles30002TestSuite::runResult.numNotSupported += result.numNotSupported;
    ActsKhrgles30002TestSuite::runResult.numWarnings += result.numWarnings;
    ActsKhrgles30002TestSuite::runResult.numWaived += result.numWaived;
    if (result.numNotSupported == 1) {
        GTEST_LOG_(INFO) << "TestCase_001985 notsupport!";
    } else if (result.isComplete) {
        EXPECT_TRUE(result.isComplete);
        EXPECT_TRUE(result.numPassed == 1);
    };
    GTEST_LOG_(INFO) << "TestCase_001985 end";
}
